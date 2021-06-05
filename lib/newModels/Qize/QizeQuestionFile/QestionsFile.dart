//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/newModels/Qize/QizeQuestionFile/Qestion.dart';

part 'QestionsFile.g.dart';

@JsonSerializable(explicitToJson: true)

//flutter packages pub run build_runner build
//endregion
class QestionsFile {
  QestionsFile(this.quizMainPage, this.qestionMap);

  final String quizMainPage;
  final Map<String, Qestion> qestionMap;
  //region jsonApi
  factory QestionsFile.fromJson(Map<String, dynamic> json) => _$QestionsFileFromJson(json);
  Map<String, dynamic> toJson() => _$QestionsFileToJson(this);
  //endregion
}
