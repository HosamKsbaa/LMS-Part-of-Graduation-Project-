//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';

import 'Qestion.dart';

part 'QestionsFile.g.dart';

@JsonSerializable(explicitToJson: true)

//flutter packages pub run build_runner build
//endregion
class QestionsFile extends Hidden {
  QestionsFile(this.quizMainPage, this.qestionMap, {String hiddenType = "QestionsFile"}) : super(hiddenType);

  final String quizMainPage;
  final Map<String, Qestion> qestionMap;
  //region jsonApi
  factory QestionsFile.fromJson(Map<String, dynamic> json) => _$QestionsFileFromJson(json);
  Map<String, dynamic> toJson() => _$QestionsFileToJson(this);
  //endregion
}
