import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/Quiz2.dart';

import '../CourseMaterialBlock.dart';

abstract class LMSEvent extends CourseMaterialBlock {
  LMSEvent(String title, String userOrgnizationAccountId, DateTime postedAt, this.eventType, List<Importance> importance, {String courseMaterialType = "LMSEvent"}) : super(title, userOrgnizationAccountId, postedAt, courseMaterialType, importance);
  final String eventType;
  //region jsonApi
  factory LMSEvent.fromJson(Map<String, dynamic> json) {
    if (json["eventType"] == "Quiz")
      return Quiz.fromJson(json);
    // else if (json["type"] == "parent")
    //   return Parent.fromJson(json);
    //
    else
      throw {"Error undefined OrgAccount type"};
  }
  Map<String, dynamic> toJson();
  //endregion
}
