// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrueFalse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrueFalse _$TrueFalseFromJson(Map<String, dynamic> json) {
  return TrueFalse(
    json['qestionHead'] as String,
    json['qestionid'] as String,
    json['qestionSection'] as String,
    (json['marks'] as num)?.toDouble(),
    seen: json['seen'] as bool,
    type: json['type'] as String,
  )..anser = json['anser'] as bool;
}

Map<String, dynamic> _$TrueFalseToJson(TrueFalse instance) => <String, dynamic>{
      'type': instance.type,
      'qestionHead': instance.qestionHead,
      'qestionid': instance.qestionid,
      'qestionSection': instance.qestionSection,
      'marks': instance.marks,
      'seen': instance.seen,
      'anser': instance.anser,
    };
