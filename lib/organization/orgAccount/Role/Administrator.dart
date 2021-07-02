import 'package:flutter/src/widgets/framework.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/adminstratir/Administrator.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/Organization.dart';

import '../OrgAccount.dart';

part 'Administrator.g.dart';

@JsonSerializable(explicitToJson: true)
class Administrator extends OrgAccount {
  Administrator(String entityId, {required OrgAccountType orgAccountType, required DateTime lastTimeEdited, required String uid, required String orgid, required EntityTyps entityTyps, required ActivitySignetreTyps activitySignetreTyps})
      : super(entityId, lastTimeEdited: lastTimeEdited, orgAccountType: OrgAccountType.Administrator, orgid: orgid, uid: uid, entityTyps: entityTyps, activitySignetreTyps: activitySignetreTyps);
  //
  // void addAstudent(CollageStudent student) {
  //   this.personalHandler.students.add(student);
  // }
  //
  // void kickStudent(CollageStudent student) {
  //   this.personalHandler.students.remove(student);
  // }
  //
  // void enrollaTeacher(Employee teacher) {
  //   this.personalHandler.Teacher.add(teacher);
  // }
  //
  // void kickTeacher(Employee teacher) {
  //   this.personalHandler.Teacher.remove(teacher);
  // }

  factory Administrator.fromJson(Map<String, dynamic> json) => _$AdministratorFromJson(json);

  Map<String, dynamic> toJson() => _$AdministratorToJson(this);

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
    hDMNavigatorPush(context, AdministratorController(orgAccount: orgAccount, org: org).data.play);
  }
}
