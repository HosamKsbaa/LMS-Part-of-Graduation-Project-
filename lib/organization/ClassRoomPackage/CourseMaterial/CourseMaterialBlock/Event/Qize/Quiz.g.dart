// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return Quiz(
    json['title'] as String,
    json['userOrgnizationAccountId'] as String,
    json['postedAt'] == null
        ? null
        : DateTime.parse(json['postedAt'] as String),
    json['eventType'] as String,
    json['quizQuestionFile'] as String,
    (json['studentAnswer'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    (json['importance'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ImportanceEnumMap, e))
        ?.toList(),
    courseMaterialType: json['courseMaterialType'] as String,
  );
}

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'userOrgnizationAccountId': instance.userOrgnizationAccountId,
      'postedAt': instance.postedAt?.toIso8601String(),
      'courseMaterialType': instance.courseMaterialType,
      'title': instance.title,
      'importance':
          instance.importance?.map((e) => _$ImportanceEnumMap[e])?.toList(),
      'eventType': instance.eventType,
      'quizQuestionFile': instance.quizQuestionFile,
      'studentAnswer': instance.studentAnswer,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ImportanceEnumMap = {
  Importance.toAll: 'toAll',
  Importance.allstudents: 'allstudents',
};
