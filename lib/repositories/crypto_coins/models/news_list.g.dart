// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsList _$NewsListFromJson(Map<String, dynamic> json) => NewsList(
      id: json['id'] as int,
      imageurl: json['imageurl'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      guid: json['guid'] as String,
    );

Map<String, dynamic> _$NewsListToJson(NewsList instance) => <String, dynamic>{
      'id': instance.id,
      'imageurl': instance.imageurl,
      'title': instance.title,
      'body': instance.body,
      'guid': instance.guid,
    };
