//region header

import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import 'AccesLevel/AccesLevel.dart';
import 'Log/Log.dart';

enum ActivitySignetreTyps {
  OrgAccount,
  Quiz,
  ClassRoom,
  LmsEvent,
  CourseMaterialBlock,
}

abstract class ActivitySignetre extends Entity {
  ActivitySignetre(String entityId, {required this.activitySignetreTyps, required DateTime lastTimeEdited, required EntityTyps entityTyps}) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: EntityTyps.ActivitySignetre) {
    log = HDMCollection<Log>(this, "Log");
    accesLevel = HDMCollection<AccesLevel>(this, "Log");
  }
  final ActivitySignetreTyps activitySignetreTyps;

  @JsonKey(ignore: true)
  late HDMCollection<Log> log;
  @JsonKey(ignore: true)
  late HDMCollection<AccesLevel> accesLevel;

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
