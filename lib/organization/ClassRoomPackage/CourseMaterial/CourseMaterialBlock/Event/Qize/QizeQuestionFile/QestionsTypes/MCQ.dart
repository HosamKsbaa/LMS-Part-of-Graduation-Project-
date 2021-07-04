//region header
import 'package:json_annotation/json_annotation.dart';

import '../Qestion.dart';

part 'MCQ.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class MCQ extends Qestion {
  MCQ({required String qestionHead, required String qestionid, required this.ansers, required bool seen, required QestionType qestionType}) : super(qestionHead: qestionHead, qestionid: qestionid, seen: seen, qestionType: QestionType.MCQ);

  final Map<String, String> ansers;

  //region jsonApi
  factory MCQ.fromJson(Map<String, dynamic> json) => _$MCQFromJson(json);
  Map<String, dynamic> toJson() => _$MCQToJson(this);
  //endregion
}
