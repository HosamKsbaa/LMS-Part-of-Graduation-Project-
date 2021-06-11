import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';

import 'Event/Event.dart';

enum CourseMaterialType {
  Event,
}

abstract class CourseMaterialBlock extends ActivitySignetre {
  CourseMaterialBlock(String entityId, {required this.title, required DateTime lastTimeEdited, required this.courseMaterialType, required this.importance}) : super(entityId, lastTimeEdited: lastTimeEdited);
  final CourseMaterialType courseMaterialType;
  final String title;
  final List<Importance> importance;

  //region jsonApi
  factory CourseMaterialBlock.fromJson(Map<String, dynamic> json) {
    if (json["courseMaterialType"] == "LMSEvent ")
      return LMSEvent.fromJson(json);
    else
      throw {"Error undefined OrgAccount type"};
  }
  Map<String, dynamic> toJson();
  //endregion
}

enum Importance {
  toAll,
  allstudents,
}
