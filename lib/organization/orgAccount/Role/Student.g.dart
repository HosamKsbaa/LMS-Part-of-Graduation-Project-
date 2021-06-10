// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    (json['classRoomList'] as List)?.map((e) => e == null ? null : ClassRoom.fromJson(e as Map<String, dynamic>))?.toList(),
    orgid: json['orgid'] as String,
  )..collectionPath = json['path'] as String;
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'path': instance.collectionPath,
      'orgid': instance.orgid,
      'classRoomList': instance.classRoomList,
    };
