import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../orgAccount/Role/Administrator.dart';
import '../orgAccount/Role/Owner.dart';
import '../orgAccount/Role/Parent.dart';
import '../orgAccount/Role/Student.dart';
import '../orgAccount/Role/Teacher.dart';

@JsonSerializable()
enum OrgAccountType {
  Administrator,
  Owner,
  Parent,
  Student,
  Teacher,
}

@JsonSerializable()
@Json(discriminatorProperty: 'type')
abstract class OrgAccount extends Entity {
  final String orgid;

  // final List<String> eventpointer;
  final OrgAccountType orgAccountType;

  OrgAccount(
    String orgAccountId, {
    @required this.orgid,
    @required this.orgAccountType,
    @required DateTime lastTimeEdited,
  }) : super(orgAccountId, lastTimeEdited: lastTimeEdited);

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
