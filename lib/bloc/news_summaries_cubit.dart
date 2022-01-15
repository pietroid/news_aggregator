import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_aggregator_flutter/repository/news_summaries_service.dart';
import 'package:news_aggregator_flutter/repository/news_summary.dart';

const previousNewsBufferNumber = 30;
const nextNewsBufferNumber = 5;

class NewsSummariesCubit extends Cubit<NewsSummariesState> {
  final newsSummariesService = Modular.get<NewsSummariesService>();
  NewsSummariesCubit() : super(NewsSummariesState());

  Future<void> fetchAll({bool onBackground = false}) async {
    if (onBackground) {
      final newState = state.copyWith(isLoadingBackground: true);
      emit(newState);
    } else {
      setLoading();
    }

    try {
      final newsSummaries = await newsSummariesService.getNewsSummaries();
      await newsSummariesService.readNewsSummaries();
      if (onBackground) {
        final newState = state.copyWith(isLoadingBackground: false);
        newState.content.addAll(newsSummaries);
        emit(newState);
      } else {
        setData(newsSummaries);
      }
    } catch (_) {
      if (!onBackground) setError();
    }
  }

  Future<void> setIndex(int index) async {
    if (state.content.length - index <= nextNewsBufferNumber &&
        !state.isLoadingBackground) {
      await fetchAll(onBackground: true);
    }
  }

  setLoading() {
    changeState(NewsSummariesStatus.error, null);
  }

  setError() {
    changeState(NewsSummariesStatus.error, null);
  }

  setData(List<NewsSummary> content) {
    changeState(NewsSummariesStatus.data, content);
  }

  changeState(NewsSummariesStatus status, List<NewsSummary>? content) {
    final newState = NewsSummariesState();
    newState.status = status;
    if (content != null) newState.content = content;
    emit(newState);
  }
}

enum NewsSummariesStatus { empty, loading, error, data }

class NewsSummariesState {
  NewsSummariesStatus status = NewsSummariesStatus.empty;
  int index = 0;
  bool isLoadingBackground = false;

  List<NewsSummary> content = [];

  NewsSummariesState copyWith({
    NewsSummariesStatus? status,
    int? index,
    bool? isLoadingBackground,
    List<NewsSummary>? content,
  }) {
    final copiedState = NewsSummariesState();
    copiedState.status = status ?? this.status;
    copiedState.index = index ?? this.index;
    copiedState.isLoadingBackground =
        isLoadingBackground ?? this.isLoadingBackground;
    copiedState.content = content ?? this.content;
    return copiedState;
  }
}
