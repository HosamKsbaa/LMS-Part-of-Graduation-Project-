// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentAnsers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentAnsers _$StudentAnsersFromJson(Map<String, dynamic> json) {
  return StudentAnsers()
    ..questionFileID = json['questionFileID'] as String
    ..answer = json['answer'] as String;
}

Map<String, dynamic> _$StudentAnsersToJson(StudentAnsers instance) => <String, dynamic>{
      'questionFileID': instance.questionFileID,
      'answer': instance.answer,
    };
