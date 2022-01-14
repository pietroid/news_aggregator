import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_aggregator_flutter/repository/news_summaries_service.dart';
import 'package:news_aggregator_flutter/repository/news_summary.dart';

class NewsSummariesCubit extends Cubit<NewsSummariesState> {
  final newsSummariesService = Modular.get<NewsSummariesService>();
  NewsSummariesCubit() : super(NewsSummariesState());
  final nstate = NewsSummariesState();

  Future<void> fetchAll() async {
    setLoading();
    try {
      final newsSummaries = await newsSummariesService.getNewsSummaries();
      setData(newsSummaries);
    } catch (_) {
      setError();
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
  var status = NewsSummariesStatus.empty;

  List<NewsSummary> content = [];
}
