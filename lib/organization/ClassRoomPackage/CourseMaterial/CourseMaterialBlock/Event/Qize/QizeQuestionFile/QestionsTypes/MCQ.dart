//region header
import 'package:json_annotation/json_annotation.dart';

import '../Qestion.dart';

part 'MCQ.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class MCQ extends Qestion {
  MCQ(String qestionHead, String qestionid, String qestionSection, double marks, {bool seen, String type = "MCQ"}) : super(qestionHead, qestionid, qestionSection, marks, seen, qestionType: type);

  Map<String, String> ansers;

  //region jsonApi
  factory MCQ.fromJson(Map<String, dynamic> json) => _$MCQFromJson(json);
  Map<String, dynamic> toJson() => _$MCQToJson(this);
  //endregion
}
