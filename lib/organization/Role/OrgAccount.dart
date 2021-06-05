import 'package:flutter/material.dart';
import 'package:lms/mydirectory/organization/Role/Administrator.dart';
import 'package:lms/mydirectory/organization/Role/Owner.dart';
import 'package:lms/mydirectory/organization/Role/Parent.dart';
import 'package:lms/mydirectory/organization/Role/Student.dart';
import 'package:lms/mydirectory/organization/Role/Teacher.dart';

abstract class OrgAccount {
  final String orgid;
  final List<String> eventpointer;
  final String type;

  OrgAccount({this.eventpointer, this.orgid,this.type});

  factory OrgAccount.fromJson(Map<String, dynamic> json) {
    if(json["type"] == "student")
      Student.fromJson(json);
    else if(json["type"] == "parent")
        Parent.fromJson(json);
    else if(json["type"] == "administrator")
      Administrator.fromJson(json);
    else if(json["type"] == "teacher")
      Teacher.fromJson(json);
    else if(json["type"] == "owner")
      Owner.fromJson(json);
    else
      throw{"Error undefined OrgAccount type"};
  }
  Map<String, dynamic> toJson();
}
