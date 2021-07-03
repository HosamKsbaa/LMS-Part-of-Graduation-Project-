//region header

import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../../CourseMaterialBlock.dart';
import '../Event.dart';

part 'Quiz2.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class Quiz extends LMSEvent {
  Quiz(
    String entityId, {
    required String title,
    required DateTime lastTimeEdited,
    required LMSEventType eventType,
    required this.quizQuestionFile,
    required this.studentAnswer,
    required List<Importance> importance,
    required EntityTyps entityTyps,
    required ActivitySignetreTyps activitySignetreTyps,
    required CourseMaterialType courseMaterialType,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, title: title, importance: importance, eventType: eventType, entityTyps: entityTyps, activitySignetreTyps: activitySignetreTyps, courseMaterialType: courseMaterialType);

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
