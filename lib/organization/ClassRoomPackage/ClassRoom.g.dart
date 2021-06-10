// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassRoom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassRoom _$ClassRoomFromJson(Map<String, dynamic> json) {
  return ClassRoom(
    classRoomName: json['classRoomName'] as String,
    classRoomId: json['entityId'] as String,
  )..collectionPath = json['path'] as String;
}

Map<String, dynamic> _$ClassRoomToJson(ClassRoom instance) => <String, dynamic>{
      'path': instance.collectionPath,
      'entityId': instance.entityId,
      'classRoomName': instance.classRoomName,
    };
