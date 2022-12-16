// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventPost _$EventPostFromJson(Map<String, dynamic> json) => EventPost(
      title: json['title'] as String,
      capacity: json['capacity'] as int,
      date: json['date'] as String,
      time: json['time'] as String,
      photo: json['photo'] as String?,
      ageLimit: json['age_limit'] as int?,
      description: json['description'] as String,
      owner: json['owner'] as int,
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$EventPostToJson(EventPost instance) => <String, dynamic>{
      'title': instance.title,
      'capacity': instance.capacity,
      'date': instance.date,
      'time': instance.time,
      'photo': instance.photo,
      'age_limit': instance.ageLimit,
      'description': instance.description,
      'owner': instance.owner,
      'interests': instance.interests,
    };
