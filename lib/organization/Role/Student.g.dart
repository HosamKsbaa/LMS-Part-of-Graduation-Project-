// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    list_of_donestudent: json['list_of_donestudent'] as List,
    type: json['type'] as String,
    orgid: json['orgid'] as String,
    eventpointer:
        (json['eventpointer'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'orgid': instance.orgid,
      'eventpointer': instance.eventpointer,
      'type': instance.type,
      'list_of_donestudent': instance.list_of_donestudent,
    };
