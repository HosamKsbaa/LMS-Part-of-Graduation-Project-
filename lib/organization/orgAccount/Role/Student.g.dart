// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    (json['classRoomList'] as List)
        ?.map((e) =>
            e == null ? null : ClassRoom.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    orgid: json['orgid'] as String,
    eventpointer:
        (json['eventpointer'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'orgid': instance.orgid,
      'eventpointer': instance.eventpointer,
      'classRoomList': instance.classRoomList,
    };
