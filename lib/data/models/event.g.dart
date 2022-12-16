// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: json['id'] as int,
      title: json['title'] as String,
      remainingCapacity: json['remaining_capacity'] as int,
      date: json['date'] as String,
      time: json['time'] as String,
      duration: json['duration'] as String,
      photo: json['photo'] as String?,
      ageLimit: json['age_limit'] as int?,
      description: json['description'] as String,
      owner: Profile.fromJson(json['owner'] as Map<String, dynamic>),
      interests: (json['interests'] as List<dynamic>)
          .map((e) => Interest.fromJson(e as Map<String, dynamic>))
          .toList(),
      attendees: (json['attendees'] as List<dynamic>?)
          ?.map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'remaining_capacity': instance.remainingCapacity,
      'date': instance.date,
      'time': instance.time,
      'duration': instance.duration,
      'photo': instance.photo,
      'address': instance.address,
      'age_limit': instance.ageLimit,
      'description': instance.description,
      'owner': instance.owner,
      'interests': instance.interests,
      'attendees': instance.attendees,
    };
