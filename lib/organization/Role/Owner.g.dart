// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    student: json['student'] as List,
    currentemployee: json['currentemployee'] as List,
    type: json['type'] as String,
    orgid: json['orgid'] as String,
    eventpointer:
        (json['eventpointer'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'orgid': instance.orgid,
      'eventpointer': instance.eventpointer,
      'type': instance.type,
      'currentemployee': instance.currentemployee,
      'student': instance.student,
    };
