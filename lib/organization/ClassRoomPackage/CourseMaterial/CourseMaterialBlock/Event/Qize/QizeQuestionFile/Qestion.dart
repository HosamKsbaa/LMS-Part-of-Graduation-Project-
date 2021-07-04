import 'QestionsTypes/MCQ.dart';
import 'QestionsTypes/TrueFalse.dart';

enum QestionType {
  MCQ,
  TrueFalse,
}

abstract class Qestion {
  Qestion({required this.qestionHead, required this.qestionid, required this.seen, required this.qestionType});

  ///MCQ
  final QestionType qestionType;
  final String qestionHead;
  final String qestionid;
  //final String qestionSection;
  //final double marks;
  final bool seen;

  //region jsonApi
  factory Qestion.fromJson(Map<String, dynamic> json) {
    var x = QestionType.values.firstWhere((e) {
      //print("testhello"+e.toString().split(".").last + "==" + json["qestionType"]);
      return e.toString().split(".").last == json["qestionType"];
    });
    assert(x != null, "there is no qestionType parameter in  ");
    if (x == QestionType.MCQ)
      return MCQ.fromJson(json);
    else if (x == QestionType.TrueFalse)
      return TrueFalse.fromJson(json);
    else
      return throw {"Error undefined ${json["qestionType"]}"};
  }
  Map<String, dynamic> toJson();
//endregion
}
