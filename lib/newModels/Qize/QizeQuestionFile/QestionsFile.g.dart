// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QestionsFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QestionsFile _$QestionsFileFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['quizMainPage', 'qestionMap']);
  return QestionsFile(
    json['quizMainPage'] as String,
    (json['qestionMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Qestion.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$QestionsFileToJson(QestionsFile instance) =>
    <String, dynamic>{
      'quizMainPage': instance.quizMainPage,
      'qestionMap': instance.qestionMap,
    };
