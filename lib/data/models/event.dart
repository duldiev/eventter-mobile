import 'package:flutter_mobile/data/models/interest.dart';
import 'package:flutter_mobile/data/models/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  int id;
  String title;
  @JsonKey(name: "remaining_capacity")
  int remainingCapacity;
  String date;
  String time;
  String duration;
  String? photo;
  String? address;
  @JsonKey(name: "age_limit")
  int? ageLimit;
  String description;
  Profile owner;
  List<Interest> interests;
  List<Profile>? attendees;

  Event({
    required this.id,
    required this.title,
    required this.remainingCapacity,
    required this.date,
    required this.time,
    required this.duration,
    this.photo,
    this.ageLimit,
    required this.description,
    required this.owner,
    required this.interests,
    this.attendees,
    this.address,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
