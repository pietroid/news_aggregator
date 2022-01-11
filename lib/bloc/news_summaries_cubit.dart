import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_aggregator_flutter/repository/news_summaries_service.dart';
import 'package:news_aggregator_flutter/repository/news_summary.dart';

class NewsSummariesCubit extends Cubit<List<NewsSummary>> {
  final newsSummariesService = Modular.get<NewsSummariesService>();
  NewsSummariesCubit() : super([]);

  Future<void> fetchAll() async {
    try {
      final newsSummaries = await newsSummariesService.getNewsSummaries();
      emit(newsSummaries);
    } catch (_) {}
  }
}
