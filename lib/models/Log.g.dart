// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) {
  return Log(
    entity: json['entity'] as String,
    event: json['event'] as String,
    orgAccount: json['orgAccount'] as String,
  );
}

Map<String, dynamic> _$LogToJson(Log instance) => <String, dynamic>{
      'entity': instance.entity,
      'event': instance.event,
      'orgAccount': instance.orgAccount,
    };
