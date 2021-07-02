//region header

import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/CourseMaterialBlock.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Event.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/Quiz2.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';

import 'AccesLevel/AccesLevel.dart';
import 'Log/Log.dart';

enum ActivitySignetreTyps {
  OrgAccount,
  Quiz,
  ClassRoom,
  LmsEvent,
  CourseMaterialBlock,
  OrgUser,
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

  factory ActivitySignetre.fromJson(Map<String, dynamic> json) {
    var x = ActivitySignetreTyps.values.firstWhere((element) => element.toString().split(".").last == json["activitySignetreTyps"]);
    assert(x != null, "there is no activitySignetreTyps parameter in ");
    switch (x) {
      case ActivitySignetreTyps.OrgAccount:
        return OrgAccount.fromJson(json);
      case ActivitySignetreTyps.ClassRoom:
        return ClassRoom.fromJson(json);
      case ActivitySignetreTyps.Quiz:
        return Quiz.fromJson(json);
      case ActivitySignetreTyps.LmsEvent:
        return LMSEvent.fromJson(json);
      case ActivitySignetreTyps.CourseMaterialBlock:
        return CourseMaterialBlock.fromJson(json);
      case ActivitySignetreTyps.OrgUser:
        return OrgUser.fromJson(json);
      default:
        return throw {"Error undefined ${json["activitySignetreTyps"]}}"};
    }
  }

  Map<String, dynamic> toJson();
//endregion

}
