// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnswerFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerFile _$AnswerFileFromJson(Map<String, dynamic> json) {
  return AnswerFile(
    json['entityId'] as String,
    _$enumDecode(_$HiddenTypeEnumMap, json['hiddenType']),
    DateTime.parse(json['lastTimeEdited'] as String),
    json['answerFileID'] as String,
    json['questionFileID'] as String,
    Duration(microseconds: json['duration'] as int),
    DateTime.parse(json['startedAt'] as String),
    json['studentId'] as String,
    (json['questionsMap'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, StudentAnsers.fromJson(e as Map<String, dynamic>)),
    ),
  )
    ..collectionPath = json['collectionPath'] as String
    ..doneSet = json['doneSet'] as bool;
}

Map<String, dynamic> _$AnswerFileToJson(AnswerFile instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'doneSet': instance.doneSet,
      'hiddenType': _$HiddenTypeEnumMap[instance.hiddenType],
      'answerFileID': instance.answerFileID,
      'questionFileID': instance.questionFileID,
      'duration': instance.duration.inMicroseconds,
      'startedAt': instance.startedAt.toIso8601String(),
      'studentId': instance.studentId,
      'questionsMap': instance.questionsMap,
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

const _$HiddenTypeEnumMap = {
  HiddenType.AnserFile: 'AnserFile',
  HiddenType.qestionFile: 'qestionFile',
};
