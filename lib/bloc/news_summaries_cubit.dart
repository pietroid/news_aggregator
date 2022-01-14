import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_aggregator_flutter/repository/news_summaries_service.dart';
import 'package:news_aggregator_flutter/repository/news_summary.dart';

const previousNewsBufferNumber = 30;
const nextNewsBufferNumber = 3;

class NewsSummariesCubit extends Cubit<NewsSummariesState> {
  final newsSummariesService = Modular.get<NewsSummariesService>();
  NewsSummariesCubit() : super(NewsSummariesState());

  Future<void> fetchAll() async {
    setLoading();
    try {
      final newsSummaries = await newsSummariesService.getNewsSummaries();
      setData(newsSummaries);
    } catch (_) {
      setError();
    }
  }

  Future<void> fetchAllBackground() async {
    try {} catch (_) {}
  }

  Future<void> setIndex(int index) async {
    print(index);
    NewsSummariesState newState = state.copyWith(index: index);
    final numberOfNewsToBeRemoved = index - previousNewsBufferNumber;
    if (numberOfNewsToBeRemoved > 0) {
      newState.index -= numberOfNewsToBeRemoved;
      newState.content = state.content.sublist(numberOfNewsToBeRemoved);
    }

    if (newState.content.length - newState.index <= nextNewsBufferNumber &&
        !newState.isLoadingBackground) {
      newState.isLoadingBackground = true;
      emit(newState);

      final newsSummaries = await newsSummariesService.getNewsSummaries();
      newState.content.addAll(newsSummaries);
      newState.isLoadingBackground = false;
      emit(newState.copyWith());
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
