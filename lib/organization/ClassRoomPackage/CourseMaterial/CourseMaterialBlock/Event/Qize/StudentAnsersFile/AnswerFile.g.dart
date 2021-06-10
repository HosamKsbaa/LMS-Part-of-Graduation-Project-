// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnswerFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerFile _$AnswerFileFromJson(Map<String, dynamic> json) {
  return AnswerFile(
    hiddenType: json['hiddenType'] as String,
  )
    ..path = json['path'] as String
    ..answerFileID = json['answerFileID'] as String
    ..questionFileID = json['questionFileID'] as String
    ..duration = json['duration'] == null
        ? null
        : Duration(microseconds: json['duration'] as int)
    ..startedAt = json['startedAt'] == null
        ? null
        : DateTime.parse(json['startedAt'] as String)
    ..studentId = json['studentId'] as String
    ..questionsMap = (json['questionsMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : StudentAnsers.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$AnswerFileToJson(AnswerFile instance) =>
    <String, dynamic>{
      'path': instance.path,
      'hiddenType': instance.hiddenType,
      'answerFileID': instance.answerFileID,
      'questionFileID': instance.questionFileID,
      'duration': instance.duration?.inMicroseconds,
      'startedAt': instance.startedAt?.toIso8601String(),
      'studentId': instance.studentId,
      'questionsMap': instance.questionsMap,
    };
