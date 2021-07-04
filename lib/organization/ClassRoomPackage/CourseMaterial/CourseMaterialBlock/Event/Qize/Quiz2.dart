//region header

import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/Qestion.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/QestionsFile.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/StudentAnsersFile/AnswerFile.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/StudentAnsersFile/StudentAnsers.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../CourseMaterialBlock.dart';
import '../Event.dart';
import 'StudentAnsersFile/AnswerFile.dart';

part 'Quiz2.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class Quiz extends LMSEvent {
  Quiz(String entityId, {required String title, required DateTime lastTimeEdited, required LMSEventType eventType, required List<Importance> importance, required EntityTyps entityTyps, required ActivitySignetreTyps activitySignetreTyps, required CourseMaterialType courseMaterialType})
      : super(
          entityId,
          lastTimeEdited: lastTimeEdited,
          title: title,
          importance: importance,
          eventType: eventType,
          entityTyps: entityTyps,
          activitySignetreTyps: activitySignetreTyps,

          courseMaterialType: courseMaterialType,
        ) {
    questioncol = HDMCollection<QestionsFile>(this, "QestionFile");
    answercol = HDMCollection<AnswerFile>(this, "AnswerFile");
  }
  @JsonKey(ignore: true)
  late HDMCollection<QestionsFile> questioncol;
  @JsonKey(ignore: true)
  late HDMCollection<AnswerFile> answercol;

  // ///qestionsFilepointer
  // final String quizQuestionFile;
  //
  // ///Map<StudentUId,StudentAnsersFile>
  // final Map<String, String> studentAnswer;


  Future<QestionsFile> addAnQestionFile({required Map<String, Qestion> qestionMap, required DateTime startDate, required DateTime endDate, required Duration allwedDuration, required String marks, required String posiibleAttimpts, required String quizMainPage, required String instructions}) async {
    var x = QestionsFile(DateTime.now().toString(), lastTimeEdited: DateTime.now(), startDate: startDate, posiibleAttimpts: posiibleAttimpts, marks: marks, allwedDuration: allwedDuration, instructions: instructions, endDate: endDate, qestionMap: qestionMap, hiddenType: HiddenType.qestionFile);
    await questioncol.add(x, ifRebeted: () {
      toast("you are alredy enroled in this org");
    });
    return x;
  }

  Future<AnswerFile> addAnAnswerFile({required OrgAccount org, required String answerFileID, required String questionFileID, required Duration duration, required DateTime startedAt, required String studentId, required Map<String, StudentAnsers> questionsMap}) async {
    var x = AnswerFile(entityId: org.orgid, lastTimeEdited: DateTime.now(), answerFileID: answerFileID, questionFileID: questionFileID, startedAt: startedAt, questionsMap: questionsMap, studentId: studentId, duration: duration, hiddenType: HiddenType.AnserFile);
    await answercol.add(x, ifRebeted: () {
      toast("you are alredy enroled in this org");
    });
    return x;
  }

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
