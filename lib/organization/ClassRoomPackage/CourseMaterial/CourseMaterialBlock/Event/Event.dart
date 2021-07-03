import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/Quiz2.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../CourseMaterialBlock.dart';

enum LMSEventType {
  Quiz,
}

abstract class LMSEvent extends CourseMaterialBlock {
  LMSEvent(String entityId, {required CourseMaterialType courseMaterialType, required String title, required DateTime lastTimeEdited, required this.eventType, required List<Importance> importance, required EntityTyps entityTyps, required ActivitySignetreTyps activitySignetreTyps})
      : super(
          entityId,
          lastTimeEdited: lastTimeEdited,
          courseMaterialType: CourseMaterialType.Event,
          importance: importance,
          title: title,
          entityTyps: entityTyps,
          activitySignetreTyps: activitySignetreTyps,
        );
  final LMSEventType eventType;
  //region jsonApi
  factory LMSEvent.fromJson(Map<String, dynamic> json) {
    var x = LMSEventType.values.firstWhere((e) {
      // print("testhello"+e.toString().split(".").last + "==" + json["eventType"]);
      return e.toString().split(".").last == json["eventType"];
    });
    assert(x != null, "there is no courseMaterialType parameter in  ");
    if (x == LMSEventType.Quiz)
      return Quiz.fromJson(json);
    else
      return throw {"Error undefined ${json["eventType"]}"};
  }
  Map<String, dynamic> toJson();
  //endregion
}
