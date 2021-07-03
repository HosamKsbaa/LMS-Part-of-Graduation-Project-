// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AccesLevel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccesLevel _$AccesLevelFromJson(Map<String, dynamic> json) {
  return AccesLevel(
    json['entityId'] as String,
    json['OrgAccountUid'] as String,
    (json['accesLevel'] as List<dynamic>)
        .map((e) => AccesLevel.fromJson(e as Map<String, dynamic>))
        .toList(),
    DateTime.parse(json['lastTimeEdited'] as String),
  )
    ..collectionPath = json['collectionPath'] as String
    ..doneSet = json['doneSet'] as bool;
}

Map<String, dynamic> _$AccesLevelToJson(AccesLevel instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'doneSet': instance.doneSet,
      'OrgAccountUid': instance.OrgAccountUid,
      'accesLevel': instance.accesLevel,
    };
