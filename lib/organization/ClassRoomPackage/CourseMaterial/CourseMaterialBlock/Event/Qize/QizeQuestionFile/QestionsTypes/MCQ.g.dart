// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MCQ.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MCQ _$MCQFromJson(Map<String, dynamic> json) {
  return MCQ(
    qestionHead: json['qestionHead'] as String,
    qestionid: json['qestionid'] as String,
    ansers: Map<String, String>.from(json['ansers'] as Map),
    seen: json['seen'] as bool,
    qestionType: _$enumDecode(_$QestionTypeEnumMap, json['qestionType']),
  );
}

Map<String, dynamic> _$MCQToJson(MCQ instance) => <String, dynamic>{
      'qestionType': _$QestionTypeEnumMap[instance.qestionType],
      'qestionHead': instance.qestionHead,
      'qestionid': instance.qestionid,
      'seen': instance.seen,
      'ansers': instance.ansers,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$QestionTypeEnumMap = {
  QestionType.MCQ: 'MCQ',
  QestionType.TrueFalse: 'TrueFalse',
};
