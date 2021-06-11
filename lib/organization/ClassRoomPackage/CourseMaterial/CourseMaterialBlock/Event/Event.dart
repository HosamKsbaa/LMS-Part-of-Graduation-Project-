import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/Quiz2.dart';

import '../CourseMaterialBlock.dart';

enum LMSEventType {
  Quiz,
}

abstract class LMSEvent extends CourseMaterialBlock {
  LMSEvent(String entityId, {required String title, required DateTime lastTimeEdited, required this.eventType, required List<Importance> importance}) : super(entityId, lastTimeEdited: lastTimeEdited, courseMaterialType: CourseMaterialType.Event, importance: importance, title: title);
  final LMSEventType eventType;
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
