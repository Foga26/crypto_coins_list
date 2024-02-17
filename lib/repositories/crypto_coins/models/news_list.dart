import 'package:json_annotation/json_annotation.dart';
part 'news_list.g.dart';

@JsonSerializable()
class NewsList {
  final int id;
  final String imageurl;
  final String title;
  final String body;
  final String guid;

  NewsList(
      {required this.id,
      required this.imageurl,
      required this.title,
      required this.body,
      required this.guid});

  factory NewsList.fromJson(Map<String, dynamic> json) =>
      _$NewsListFromJson(json);
  Map<String, dynamic> toJson() => _$NewsListToJson(this);
}
