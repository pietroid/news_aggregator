import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_aggregator_flutter/repository/news_summary.dart';

class NewsSummariesService {
  final client = http.Client();

  Future<List<NewsSummary>> getNewsSummaries() async {
    final response = await client.get(
        Uri.parse('http://192.168.15.36:3000/news/summaries?news_number=10'));
    final decodedJson = jsonDecode(response.body);
    final newsSummariesJson = decodedJson['newsSummaries'].toList();
    return newsSummariesJson
        .map<NewsSummary>(
            (newsSummaryJson) => NewsSummary.fromJson(newsSummaryJson))
        .toList() as List<NewsSummary>;
  }

  Future<void> readNewsSummaries() async {
    await client.patch(Uri.parse(
        'http://192.168.15.36:3000/news/summaries/read?news_number=10'));
  }
}
