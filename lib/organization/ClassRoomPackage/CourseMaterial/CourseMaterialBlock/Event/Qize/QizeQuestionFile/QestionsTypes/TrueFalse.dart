//region header
import 'package:json_annotation/json_annotation.dart';

import '../Qestion.dart';

part 'TrueFalse.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class TrueFalse extends Qestion {
  TrueFalse(String qestionHead, String qestionid, String qestionSection, double marks, {bool seen, String type: "TrueFalse"}) : super(qestionHead, qestionid, qestionSection, marks, seen, type: type);

  ///true = true , false = false
  bool anser;

  //region jsonApi
  factory TrueFalse.fromJson(Map<String, dynamic> json) => _$TrueFalseFromJson(json);
  Map<String, dynamic> toJson() => _$TrueFalseToJson(this);
  //endregion
}
