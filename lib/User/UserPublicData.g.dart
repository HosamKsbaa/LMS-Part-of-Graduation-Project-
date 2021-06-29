// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPublicData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPublicData _$UserPublicDataFromJson(Map<String, dynamic> json) {
  return UserPublicData(
    displayName: json['displayName'] as String,
    userProfilePic: json['userProfilePic'] as String,
    FcmToken: json['FcmToken'] as String,
  )
    ..lastTimeEdited = DateTime.parse(json['lastTimeEdited'] as String)
    ..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$UserPublicDataToJson(UserPublicData instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'displayName': instance.displayName,
      'userProfilePic': instance.userProfilePic,
      'FcmToken': instance.FcmToken,
    };
