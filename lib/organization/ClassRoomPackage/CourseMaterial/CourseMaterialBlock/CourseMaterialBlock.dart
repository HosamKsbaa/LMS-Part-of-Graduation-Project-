import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import 'Event/Event.dart';

abstract class CourseMaterialBlock extends Entity {
  CourseMaterialBlock(this.title, String userOrgnizationAccountId, DateTime postedAt, this.courseMaterialType, this.importance, {String activitySignetreType = "CourseMaterialBlock"}) : super('', '', null);
  final String courseMaterialType;
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
