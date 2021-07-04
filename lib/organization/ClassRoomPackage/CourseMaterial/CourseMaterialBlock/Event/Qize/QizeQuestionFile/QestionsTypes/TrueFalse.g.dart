// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrueFalse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrueFalse _$TrueFalseFromJson(Map<String, dynamic> json) {
  return TrueFalse(
    json['anser'] as bool,
    qestionHead: json['qestionHead'] as String,
    qestionid: json['qestionid'] as String,
    seen: json['seen'] as bool,
    qestionType: _$enumDecode(_$QestionTypeEnumMap, json['qestionType']),
  );
}

Map<String, dynamic> _$TrueFalseToJson(TrueFalse instance) => <String, dynamic>{
      'qestionType': _$QestionTypeEnumMap[instance.qestionType],
      'qestionHead': instance.qestionHead,
      'qestionid': instance.qestionid,
      'seen': instance.seen,
      'anser': instance.anser,
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
