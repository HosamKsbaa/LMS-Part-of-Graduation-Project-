//region header

import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/Qestion.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/QestionsFile.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/StudentAnsersFile/AnswerFile.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/StudentAnsersFile/StudentAnsers.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';
import 'package:lms/organization/Organization.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../CourseMaterialBlock.dart';
import '../Event.dart';

part 'Quiz2.g.dart';

@JsonSerializable()
//flutter packages pub run build_runner build
//endregion
class Quiz extends LMSEvent {
  Quiz(String entityId, {required String title, required DateTime lastTimeEdited, required LMSEventType eventType, required this.quizQuestionFile, required this.studentAnswer, required List<Importance> importance, required EntityTyps entityTyps, required ActivitySignetreTyps activitySignetreTyps})
      : super(
          entityId,
          lastTimeEdited: lastTimeEdited,
          title: title,
          importance: importance,
          eventType: LMSEventType.Quiz,
          entityTyps: entityTyps,
          activitySignetreTyps: activitySignetreTyps,
          courseMaterialType: CourseMaterialType.Event,
        ) {
    questioncol = HDMCollection<QestionsFile>(this, "QestionFile");
    answercol = HDMCollection<AnswerFile>(this, "AnswerFile");
  }

  @JsonKey(ignore: true)
  late HDMCollection<QestionsFile> questioncol;
  @JsonKey(ignore: true)
  late HDMCollection<AnswerFile> answercol;

  ///qestionsFilepointer
  final String quizQuestionFile;

  ///Map<StudentUId,StudentAnsersFile>
  final Map<String, String> studentAnswer;

  Future<QestionsFile> addAnQestionFile({required Organization org, required String quizmainpage, required Map<String, Qestion> qestionMap}) async {
    var x = QestionsFile(org.entityId, quizMainPage: quizmainpage, lastTimeEdited: DateTime.now());
    await questioncol.add(x, ifRebeted: () {
      toast("you are alredy enroled in this org");
    });
    return x;
  }

  Future<AnswerFile> addAnAnswerFile(
      {required Organization org, required HiddenType hiddenType, required String answerFileID, required String questionFileID, required Duration duration, required DateTime startedAt, required String studentId, required Map<String, StudentAnsers> questionsMap}) async {
    var x = AnswerFile(entityId: org.entityId, hiddenType: hiddenType, lastTimeEdited: DateTime.now(), answerFileID: answerFileID, questionFileID: questionFileID, startedAt: startedAt, questionsMap: questionsMap, studentId: studentId, duration: duration);
    await answercol.add(x, ifRebeted: () {
      toast("you are alredy enroled in this org");
    });
    return x;
  }

  //region jsonApi
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);

//endregion
}
