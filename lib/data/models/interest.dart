import 'package:json_annotation/json_annotation.dart';

part 'interest.g.dart';

@JsonSerializable()
class Interest {
  int id;
  String title;

  Interest({required this.id, required this.title});

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);

  Map<String, dynamic> toJson() => _$InterestToJson(this);
}
