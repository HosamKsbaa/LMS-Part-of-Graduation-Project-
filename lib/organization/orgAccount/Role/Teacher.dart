import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/Teacher/Teacher.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../../Organization.dart';
import '../OrgAccount.dart';

part 'Teacher.g.dart';

@JsonSerializable()
class Teacher extends OrgAccount {
  List<ClassRoom> coursesList;

  Teacher(
    String entityId, {
    required this.coursesList,
    required OrgAccountType orgAccountType,
    required String orgid,
    required String uid,
    required DateTime lastTimeEdited,
    required EntityTyps entityTyps,
    required ActivitySignetreTyps activitySignetreTyps,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, orgAccountType: OrgAccountType.Teacher, orgid: orgid, uid: uid, entityTyps: entityTyps, activitySignetreTyps: activitySignetreTyps);

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
  @override
  void widget({required OrgAccount orgAccount, required Organization org, required BuildContext context}) {
    hDMNavigatorPush(context, TeacherController(orgAccount: orgAccount, org: org).data.play);
  }
}
