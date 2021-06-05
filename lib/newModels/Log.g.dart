// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Log _$LogFromJson(Map<String, dynamic> json) {
  return Log()
    ..orgAccountId = json['orgAccountId'] as String
    ..entityId = json['entityId'] as String
    ..event = json['event'] as Map<String, dynamic>;
}

Map<String, dynamic> _$LogToJson(Log instance) => <String, dynamic>{
      'orgAccountId': instance.orgAccountId,
      'entityId': instance.entityId,
      'event': instance.event,
    };
