import 'package:json_annotation/json_annotation.dart';
part 'news_summary.g.dart';

@JsonSerializable()
class NewsSummary {
  final String title, mainText, mainImageURL, newsSourceURL;
  NewsSummary({
    required this.title,
    required this.mainText,
    required this.mainImageURL,
    required this.newsSourceURL,
  });

  factory NewsSummary.fromJson(Map<String, dynamic> json) =>
      _$NewsSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSummaryToJson(this);
}
