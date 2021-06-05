// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MCQ.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MCQ _$MCQFromJson(Map<String, dynamic> json) {
  return MCQ(
    json['qestionHead'] as String,
    json['qestionid'] as String,
    json['qestionSection'] as String,
    (json['marks'] as num)?.toDouble(),
    seen: json['seen'] as bool,
    type: json['type'] as String,
  )..ansers = (json['ansers'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    );
}

Map<String, dynamic> _$MCQToJson(MCQ instance) => <String, dynamic>{
      'type': instance.type,
      'qestionHead': instance.qestionHead,
      'qestionid': instance.qestionid,
      'qestionSection': instance.qestionSection,
      'marks': instance.marks,
      'seen': instance.seen,
      'ansers': instance.ansers,
    };
