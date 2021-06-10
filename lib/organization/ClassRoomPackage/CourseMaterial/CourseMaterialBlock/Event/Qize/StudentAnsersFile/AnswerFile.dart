//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';

import 'StudentAnsers.dart';

part 'AnswerFile.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class AnswerFile extends Hidden {
  AnswerFile({String hiddenType = "AnswerFile"}) : super(hiddenType);
  String answerFileID;
  String questionFileID;
  Duration duration;
  DateTime startedAt;
  String studentId;

  ///Map<questionId,Answer >
  Map<String, StudentAnsers> questionsMap;

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
