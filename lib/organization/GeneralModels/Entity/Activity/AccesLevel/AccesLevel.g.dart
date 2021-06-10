// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccesLevel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccesLevel _$AccesLevelFromJson(Map<String, dynamic> json) {
  return AccesLevel(
    json['entityId'] as String,
    json['OrgAccountUid'] as String,
    (json['accesLevel'] as List)
        ?.map((e) =>
            e == null ? null : AccesLevel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['lastTimeEdited'] == null
        ? null
        : DateTime.parse(json['lastTimeEdited'] as String),
  )..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$AccesLevelToJson(AccesLevel instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited?.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'OrgAccountUid': instance.OrgAccountUid,
      'accesLevel': instance.accesLevel,
    };
