// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPriviteDate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPriviteDate _$UserPriviteDateFromJson(Map<String, dynamic> json) {
  return UserPriviteDate(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    gender: json['gender'] as String,
    Birthday: DateTime.parse(json['Birthday'] as String),
    PhoneNumber: json['PhoneNumber'] as String,
    email: json['email'] as String,
  )
    ..lastTimeEdited = DateTime.parse(json['lastTimeEdited'] as String)
    ..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$UserPriviteDateToJson(UserPriviteDate instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'Birthday': instance.Birthday.toIso8601String(),
      'PhoneNumber': instance.PhoneNumber,
      'email': instance.email,
    };
