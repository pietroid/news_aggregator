// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSource _$NewsSourceFromJson(Map<String, dynamic> json) => NewsSource(
      name: json['name'] as String,
      iconURL: json['iconURL'] as String,
      mainURL: json['mainURL'] as String,
    );

Map<String, dynamic> _$NewsSourceToJson(NewsSource instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iconURL': instance.iconURL,
      'mainURL': instance.mainURL,
    };
