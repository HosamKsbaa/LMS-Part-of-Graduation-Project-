//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';

import 'StudentAnsers.dart';

part 'AnswerFile.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class AnswerFile extends Hidden {
  AnswerFile(String entityId, HiddenType hiddenType, DateTime lastTimeEdited, this.answerFileID, this.questionFileID, this.duration, this.startedAt, this.studentId, this.questionsMap) : super(entityId, hiddenType: HiddenType.AnserFile, lastTimeEdited: lastTimeEdited);
  final String answerFileID;
  final String questionFileID;
  final Duration duration;
  final DateTime startedAt;
  final String studentId;

  ///Map<questionId,Answer >
  final Map<String, StudentAnsers> questionsMap;
  void addAnAnser() {}

  //region jsonApi
  factory AnswerFile.fromJson(Map<String, dynamic> json) => _$AnswerFileFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerFileToJson(this);

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
