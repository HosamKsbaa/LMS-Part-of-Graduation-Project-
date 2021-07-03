// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QestionsFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QestionsFile _$QestionsFileFromJson(Map<String, dynamic> json) {
  return QestionsFile(
    json['entityId'] as String,
    quizMainPage: json['quizMainPage'] as String,
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
  )
    ..collectionPath = json['collectionPath'] as String

    ..doneSet = json['doneSet'] as bool
    ..qestionMap = (json['qestionMap'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, Qestion.fromJson(e as Map<String, dynamic>)),
    );
}

Map<String, dynamic> _$QestionsFileToJson(QestionsFile instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'doneSet': instance.doneSet,
      'quizMainPage': instance.quizMainPage,
      'qestionMap': instance.qestionMap.map((k, e) => MapEntry(k, e.toJson())),
    };
