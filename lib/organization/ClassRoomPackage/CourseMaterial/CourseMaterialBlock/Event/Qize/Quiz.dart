//region header
import 'package:json_annotation/json_annotation.dart';

part 'Quiz.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class Quiz {
  Quiz();

  ///qestionsFilepointer
  String quizQuestionFile;

  ///Map<StudentUId,StudentAnsersFile>
  Map<String, String> studentAnswer;

  //region jsonApi
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
  //endregion
}
