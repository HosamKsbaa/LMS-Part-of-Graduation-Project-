//region header
import 'package:json_annotation/json_annotation.dart';

import '../Qestion.dart';

part 'TrueFalse.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class TrueFalse extends Qestion {
  TrueFalse(String qestionHead, String qestionid, String qestionSection, double marks, this.anser, {required bool seen, required QestionType qestionType}) : super(qestionHead: qestionHead, qestionid: qestionid, qestionSection: qestionSection, marks: marks, seen: seen, qestionType: QestionType.MCQ);

  ///true = true , false = false
  final bool anser;

  //region jsonApi
  factory TrueFalse.fromJson(Map<String, dynamic> json) => _$TrueFalseFromJson(json);
  Map<String, dynamic> toJson() => _$TrueFalseToJson(this);
  //endregion
}
