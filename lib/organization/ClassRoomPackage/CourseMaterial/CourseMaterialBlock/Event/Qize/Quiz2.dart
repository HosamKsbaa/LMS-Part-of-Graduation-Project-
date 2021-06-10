//region header

import 'package:json_annotation/json_annotation.dart';

import '../../CourseMaterialBlock.dart';
import '../Event.dart';

part 'Quiz2.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class Quiz extends LMSEvent {
  Quiz({
    String title,
    DateTime postedAt,
    String eventType,
    String userOrgnizationAccountId,
    this.quizQuestionFile,
    this.studentAnswer,
    List<Importance> importance,
    String courseMaterialType = "Event",
  }) : super(
          title,
          userOrgnizationAccountId,
          postedAt,
          eventType,
          importance,
          courseMaterialType: courseMaterialType,
        );

  ///qestionsFilepointer
  final String quizQuestionFile;

  ///Map<StudentUId,StudentAnsersFile>
  final Map<String, String> studentAnswer;

  //region jsonApi
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
//endregion
}
