// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassRoom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassRoom _$ClassRoomFromJson(Map<String, dynamic> json) {
  return ClassRoom(
    classRoomName: json['classRoomName'] as String,
    entityId: json['entityId'] as String,
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
  )..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$ClassRoomToJson(ClassRoom instance) => <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'classRoomName': instance.classRoomName,
    };
