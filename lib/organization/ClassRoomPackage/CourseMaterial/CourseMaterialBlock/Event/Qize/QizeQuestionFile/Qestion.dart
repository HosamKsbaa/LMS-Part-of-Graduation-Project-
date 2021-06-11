import 'QestionsTypes/MCQ.dart';
import 'QestionsTypes/TrueFalse.dart';

enum QestionType {
  MCQ,
  TrueFalse,
}

abstract class Qestion {
  Qestion({required this.qestionHead, required this.qestionid, required this.qestionSection, required this.marks, required this.seen, required this.qestionType});

  ///MCQ
  final QestionType qestionType;
  final String qestionHead;
  final String qestionid;
  final String qestionSection;
  final double marks;
  final bool seen;
  //region jsonApi
  factory Qestion.fromJson(Map<String, dynamic> json) {
    // if(Map[]){
    //
    // }
    if (json["qestionType"] == "MCQ")
      return MCQ.fromJson(json);
    else if (json["qestionType"] == "String")
      return TrueFalse.fromJson(json);
    else
      throw {"bad"};
  }
  Map<String, dynamic> toJson();
//endregion
}
