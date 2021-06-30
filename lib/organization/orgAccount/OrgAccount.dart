import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../orgAccount/Role/Administrator.dart';
import '../orgAccount/Role/Owner.dart';
import '../orgAccount/Role/Parent.dart';
import '../orgAccount/Role/Student.dart';
import '../orgAccount/Role/Teacher.dart';

enum OrgAccountType {
  Administrator,
  Owner,
  Parent,
  Student,
  Teacher,
}

abstract class OrgAccount extends ActivitySignetre {
  final String orgid;

  // final List<String> eventpointer;
  final String uid;
  final OrgAccountType orgAccountType;

  OrgAccount(
    String entityId, {
    required this.uid,
    required this.orgid,
    required this.orgAccountType,
    required DateTime lastTimeEdited,
    required EntityTyps entityTyps,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: entityTyps, activitySignetreTyps: ActivitySignetreTyps.OrgAccount);

  factory OrgAccount.fromJson(Map<String, dynamic> json) {
    if (json["orgAccountType"] == "student")
      return Student.fromJson(json);
    else if (json["orgAccountType"] == "parent")
      return Parent.fromJson(json);
    else if (json["orgAccountType"] == "administrator")
      return Administrator.fromJson(json);
    else if (json["orgAccountType"] == "teacher")
      return Teacher.fromJson(json);
    else if (json["orgAccountType"] == "owner")
      return Owner.fromJson(json);
    else
      throw {"Error undefined OrgAccount orgAccountType"};
  }
  Map<String, dynamic> toJson();
}
