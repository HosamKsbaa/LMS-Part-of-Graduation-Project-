import 'QestionsTypes/MCQ.dart';
import 'QestionsTypes/TrueFalse.dart';

abstract class Qestion {
  Qestion(this.qestionHead, this.qestionid, this.qestionSection, this.marks, this.seen, {this.type});

  ///MCQ
  final String type;
  final String qestionHead;
  final String qestionid;
  final String qestionSection;
  double marks;
  bool seen;
  //region jsonApi
  factory Qestion.fromJson(Map<String, dynamic> json) {
    // if(Map[]){
    //
    // }
    if (json["type"] == "MCQ")
      return MCQ.fromJson(json);
    else if (json["type"] == "String")
      return TrueFalse.fromJson(json);
    else
      throw {"bad"};
  }
  Map<String, dynamic> toJson();
//endregion
}
