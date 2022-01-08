// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSummary _$NewsSummaryFromJson(Map<String, dynamic> json) => NewsSummary(
      title: json['title'] as String,
      mainText: json['mainText'] as String,
      mainImageURL: json['mainImageURL'] as String,
      newsSourceURL: json['newsSourceURL'] as String,
    );

Map<String, dynamic> _$NewsSummaryToJson(NewsSummary instance) =>
    <String, dynamic>{
      'title': instance.title,
      'mainText': instance.mainText,
      'mainImageURL': instance.mainImageURL,
      'newsSourceURL': instance.newsSourceURL,
    };
