import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/Student.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../../Organization.dart';count.dart';

import '../OrgAccount.dart';

part 'Student.g.dart';

@JsonSerializable(nullable: true)
class Student extends OrgAccount {
  final List<ClassRoom> classRoomList;

  Student(
    String entityId, {
    required this.classRoomList,
    required OrgAccountType orgAccountType,
    required DateTime lastTimeEdited,
    required String uid,
    required String orgid,
    required EntityTyps entityTyps,

    required ActivitySignetreTyps activitySignetreTyps,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, orgAccountType: OrgAccountType.Student, orgid: orgid, uid: uid, entityTyps: entityTyps,activitySignetreTyps: activitySignetreTyps);
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);

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
    hDMNavigatorPush(context, StudentController(orgAccount: orgAccount, org: org).data.play);

  }
}
