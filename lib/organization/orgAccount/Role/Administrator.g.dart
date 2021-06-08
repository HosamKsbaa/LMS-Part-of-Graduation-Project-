// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Administrator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Administrator _$AdministratorFromJson(Map<String, dynamic> json) {
  return Administrator(
    type: json['type'] as String,
    orgid: json['orgid'] as String,
    eventpointer:
        (json['eventpointer'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AdministratorToJson(Administrator instance) =>
    <String, dynamic>{
      'orgid': instance.orgid,
      'eventpointer': instance.eventpointer,
      'type': instance.type,
    };
