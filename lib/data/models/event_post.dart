import 'package:flutter_mobile/data/models/interest.dart';
import 'package:flutter_mobile/data/models/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_post.g.dart';

@JsonSerializable()
class EventPost {
  String title;
  int capacity;
  String date;
  String time;
  String? photo;
  @JsonKey(name: "age_limit")
  int? ageLimit;
  String description;
  int owner;
  List<int> interests;

  EventPost({
    required this.title,
    required this.capacity,
    required this.date,
    required this.time,
    this.photo,
    this.ageLimit,
    required this.description,
    required this.owner,
    required this.interests,
  });

  factory EventPost.fromJson(Map<String, dynamic> json) =>
      _$EventPostFromJson(json);

  Map<String, dynamic> toJson() => _$EventPostToJson(this);
}
