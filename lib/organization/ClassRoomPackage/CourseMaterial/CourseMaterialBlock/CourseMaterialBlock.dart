import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import 'Announecmt2/Announecmt.dart';
import 'Event/Event.dart';

enum CourseMaterialType {
  Event,
  Announecmtextends,
}

abstract class CourseMaterialBlock extends ActivitySignetre {
  CourseMaterialBlock(String entityId, {required this.title, required DateTime lastTimeEdited, required this.courseMaterialType, required this.importance, required EntityTyps entityTyps, required ActivitySignetreTyps activitySignetreTyps})
      : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: EntityTyps.ActivitySignetre, activitySignetreTyps: activitySignetreTyps);
  final CourseMaterialType courseMaterialType;
  final String title;
  final List<Importance> importance;

  //region jsonApi
  factory CourseMaterialBlock.fromJson(Map<String, dynamic> json) {
    var x = CourseMaterialType.values.firstWhere((e) {
      // print("testhello"+e.toString().split(".").last + "==" + json["courseMaterialType"]);
      return e.toString().split(".").last == json["courseMaterialType"];
    });
    assert(x != null, "there is no courseMaterialType parameter in  ");
    if (x == CourseMaterialType.Event)
      return LMSEvent.fromJson(json);
    else if (x == CourseMaterialType.Announecmtextends)
      return Announecmtextends.fromJson(json);
    else
      return throw {"Error undefined ${json["courseMaterialType"]}"};
  }
  Map<String, dynamic> toJson();
  //endregion
}

enum Importance {
  toAll,
  allstudents,
}
