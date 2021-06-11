//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';

import 'Qestion.dart';

part 'QestionsFile.g.dart';

@JsonSerializable(explicitToJson: true)

//flutter packages pub run build_runner build
//endregion
class QestionsFile extends Hidden {
  QestionsFile(String entityId, {required this.quizMainPage, required this.qestionMap, required DateTime lastTimeEdited}) : super(entityId, lastTimeEdited: lastTimeEdited, hiddenType: HiddenType.qestionFile);

  final String quizMainPage;
  final Map<String, Qestion> qestionMap;
  //region jsonApi
  factory QestionsFile.fromJson(Map<String, dynamic> json) => _$QestionsFileFromJson(json);
  Map<String, dynamic> toJson() => _$QestionsFileToJson(this);

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
