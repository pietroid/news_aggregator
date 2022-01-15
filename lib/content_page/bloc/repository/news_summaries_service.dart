import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_aggregator_flutter/content_page/repository/news_summary.dart';

class NewsSummariesService {
  final client = http.Client();

  Future<List<NewsSummary>> getNewsSummaries() async {
    final response = await client.get(Uri.parse(
        'https://9187-2804-431-cff4-3b30-bd51-a73-eb92-7636.ngrok.io/news/summaries?news_number=10'));
    final decodedJson = jsonDecode(response.body);
    final newsSummariesJson = decodedJson['newsSummaries'].toList();
    return newsSummariesJson
        .map<NewsSummary>(
            (newsSummaryJson) => NewsSummary.fromJson(newsSummaryJson))
        .toList() as List<NewsSummary>;
  }

  Future<void> readNewsSummaries() async {
    await client.patch(Uri.parse(
        'https://9187-2804-431-cff4-3b30-bd51-a73-eb92-7636.ngrok.io/news/summaries/read?news_number=10'));
  }
}
