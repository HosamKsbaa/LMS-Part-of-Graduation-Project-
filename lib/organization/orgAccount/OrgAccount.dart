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

    required ActivitySignetreTyps activitySignetreTyps,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: entityTyps, activitySignetreTyps:activitySignetreTyps);

  factory OrgAccount.fromJson(Map<String, dynamic> json) {
    var x = OrgAccountType.values.firstWhere((element) =>
    element.toString().split(".") == json["orgAccountType"]);
    assert(x != null ,"there is no orgAccountType parameter in ");
    switch(x) {
      case OrgAccountType.Student:
        return Student.fromJson(json);
      case OrgAccountType.Parent:
        return Parent.fromJson(json);
      case OrgAccountType.Administrator:
        return Administrator.fromJson(json);
      case OrgAccountType.Teacher:
        return Teacher.fromJson(json);
      case OrgAccountType.Owner:
        return Owner.fromJson(json);
      default:
        return throw {"Error undefined ${json["orgAccountType"]}}"};
  }
  }
  Map<String, dynamic> toJson();
}
