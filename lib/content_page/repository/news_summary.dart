import 'package:json_annotation/json_annotation.dart';

import 'news_source.dart';
part 'news_summary.g.dart';

@JsonSerializable()
class NewsSummary {
  final String title, mainText, mainImageURL, newsSourceURL;
  @JsonKey()
  final NewsSource newsPage;
  NewsSummary({
    required this.title,
    required this.mainText,
    required this.mainImageURL,
    required this.newsSourceURL,
    required this.newsPage,
  });

  factory NewsSummary.fromJson(Map<String, dynamic> json) =>
      _$NewsSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSummaryToJson(this);
}
