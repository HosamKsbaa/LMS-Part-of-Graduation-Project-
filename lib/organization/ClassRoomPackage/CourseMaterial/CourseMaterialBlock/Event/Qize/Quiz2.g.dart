// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Quiz2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return Quiz(
    title: json['title'] as String,
    eventType: json['eventType'] as String,
    quizQuestionFile: json['quizQuestionFile'] as String,
    studentAnswer: (json['studentAnswer'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    importance: (json['importance'] as List)?.map((e) => _$enumDecodeNullable(_$ImportanceEnumMap, e))?.toList(),
    courseMaterialType: json['courseMaterialType'] as String,
  )..collectionPath = json['path'] as String;
}

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'path': instance.collectionPath,
      'courseMaterialType': instance.courseMaterialType,
      'title': instance.title,
      'importance': instance.importance?.map((e) => _$ImportanceEnumMap[e])?.toList(),
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

  final value = enumValues.entries.singleWhere((e) => e.value == source, orElse: () => null)?.key;

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
