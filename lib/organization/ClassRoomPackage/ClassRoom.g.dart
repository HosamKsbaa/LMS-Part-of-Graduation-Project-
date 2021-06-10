// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassRoom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassRoom _$ClassRoomFromJson(Map<String, dynamic> json) {
  return ClassRoom(
    classRoomName: json['classRoomName'] as String,
  )..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$ClassRoomToJson(ClassRoom instance) => <String, dynamic>{
      'collectionPath': instance.collectionPath,
      'classRoomName': instance.classRoomName,
    };
