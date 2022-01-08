import 'package:json_annotation/json_annotation.dart';
part 'news_source.g.dart';

@JsonSerializable()
class NewsSource {
  final String name, iconURL, mainURL;
  NewsSource({
    required this.name,
    required this.iconURL,
    required this.mainURL,
  });
  factory NewsSource.fromJson(Map<String, dynamic> json) =>
      _$NewsSourceFromJson(json);

  Map<String, dynamic> toJson() => _$NewsSourceToJson(this);
}
