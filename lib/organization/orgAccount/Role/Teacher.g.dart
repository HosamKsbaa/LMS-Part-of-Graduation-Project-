// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    coursesList: (json['coursesList'] as List)?.map((e) => e == null ? null : ClassRoom.fromJson(e as Map<String, dynamic>))?.toList(),
    orgid: json['orgid'] as String,
  )..collectionPath = json['path'] as String;
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'path': instance.collectionPath,
      'orgid': instance.orgid,
      'coursesList': instance.coursesList,
    };
