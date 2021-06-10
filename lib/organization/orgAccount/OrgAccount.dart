import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../orgAccount/Role/Administrator.dart';
import '../orgAccount/Role/Owner.dart';
import '../orgAccount/Role/Parent.dart';
import '../orgAccount/Role/Student.dart';
import '../orgAccount/Role/Teacher.dart';

abstract class OrgAccount extends Entity {
  final String orgid;

  // final List<String> eventpointer;
  final String orgAccountType;

  OrgAccount({
    //this.eventpointer,
    this.orgid,
    this.orgAccountType,
    String orgAccountId,
    String collection,
    Entity parent,
  }) : super(orgAccountId, "OrgAccount", parent);

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
