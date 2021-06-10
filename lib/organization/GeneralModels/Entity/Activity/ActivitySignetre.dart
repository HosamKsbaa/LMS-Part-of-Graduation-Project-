//region header

import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import 'AccesLevel/AccesLevel.dart';
import 'Log/Log.dart';

abstract class ActivitySignetre extends Entity {
  ActivitySignetre(String entityId, {this.postedAt, DateTime lastTimeEdited}) : super(entityId, lastTimeEdited: lastTimeEdited) {
    log = HDMCollection<Log>(this, "Log");
    accesLevel = HDMCollection<AccesLevel>(this, "Log");
  }

  HDMCollection<Log> log;
  HDMCollection<AccesLevel> accesLevel;

  final DateTime postedAt;

  //region jsonApi
  // factory ActivitySignetre.fromJson(Map<String, dynamic> json) {
  //   if (json["activitySignetreType"] == "CourseMaterialBlock")
  //     return CourseMaterialBlock.fromJson(json);
  //   // else if (json["activitySignetreType"] == "parent")
  //   //   return Parent.fromJson(json);
  //   //
  //   else
  //     throw {"this Shoud be implemented only at intractionBlock  n "};
  // }
  Map<String, dynamic> toJson();
  //endregion
}
