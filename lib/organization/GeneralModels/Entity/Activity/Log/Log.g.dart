// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) {
  return Log(
    json['entityId'] as String,
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
    orgAccountId: json['orgAccountId'] as String,
    event: json['event'] as Map<String, dynamic>,
  )..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$LogToJson(Log instance) => <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'orgAccountId': instance.orgAccountId,
      'entityId': instance.entityId,
      'event': instance.event,
    };
