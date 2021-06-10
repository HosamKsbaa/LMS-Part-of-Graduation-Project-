// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QestionsFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QestionsFile _$QestionsFileFromJson(Map<String, dynamic> json) {
  return QestionsFile(
    json['quizMainPage'] as String,
    (json['qestionMap'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e == null ? null : Qestion.fromJson(e as Map<String, dynamic>)),
    ),
    hiddenType: json['hiddenType'] as String,
  )..collectionPath = json['path'] as String;
}

Map<String, dynamic> _$QestionsFileToJson(QestionsFile instance) => <String, dynamic>{
      'path': instance.collectionPath,
      'hiddenType': instance.hiddenType,
      'quizMainPage': instance.quizMainPage,
      'qestionMap': instance.qestionMap?.map((k, e) => MapEntry(k, e?.toJson())),
    };
