// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Quiz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return Quiz()
    ..quizQuestionFile = json['quizQuestionFile'] as String
    ..studentAnswer = (json['studentAnswer'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    );
}

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'quizQuestionFile': instance.quizQuestionFile,
      'studentAnswer': instance.studentAnswer,
    };
