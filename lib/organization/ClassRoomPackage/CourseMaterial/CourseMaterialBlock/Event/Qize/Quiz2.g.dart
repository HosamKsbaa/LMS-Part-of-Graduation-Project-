// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Quiz2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return Quiz(
    json['entityId'] as String,
    title: json['title'] as String,
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
    eventType: _$enumDecode(_$LMSEventTypeEnumMap, json['eventType']),
    quizQuestionFile: json['quizQuestionFile'] as String,
    studentAnswer: Map<String, String>.from(json['studentAnswer'] as Map),
    importance: (json['importance'] as List<dynamic>)
        .map((e) => _$enumDecode(_$ImportanceEnumMap, e))
        .toList(),
  )..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'title': instance.title,
      'importance':
          instance.importance.map((e) => _$ImportanceEnumMap[e]).toList(),
      'eventType': _$LMSEventTypeEnumMap[instance.eventType],
      'quizQuestionFile': instance.quizQuestionFile,
      'studentAnswer': instance.studentAnswer,
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

const _$LMSEventTypeEnumMap = {
  LMSEventType.Quiz: 'Quiz',
};

const _$ImportanceEnumMap = {
  Importance.toAll: 'toAll',
  Importance.allstudents: 'allstudents',
};
