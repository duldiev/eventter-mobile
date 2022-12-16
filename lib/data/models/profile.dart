import 'package:flutter_mobile/data/models/interest.dart';
import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  int id;
  @JsonKey(name: "first_name")
  String firstName;
  @JsonKey(name: "last_name")
  String lastName;
  String? sex;
  @JsonKey(name: "birth_date")
  String? birthDate;
  String? bio;
  List<Interest>? interests;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.sex,
    this.birthDate,
    this.bio,
    this.interests,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
