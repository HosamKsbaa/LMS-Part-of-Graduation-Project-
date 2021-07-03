import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoomPointer.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/Organization.dart';
import 'package:overlay_support/overlay_support.dart';

import '../Organization.dart';
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
  }) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: entityTyps, activitySignetreTyps: activitySignetreTyps) {
    classRoomPointer = HDMCollection<ClassRoomPointer>(this, "classRoomPointer");
  }
  @JsonKey(ignore: true)
  late HDMCollection<ClassRoomPointer> classRoomPointer;
  Future<ClassRoomPointer> addAnClassRoomPointer({required ClassRoom classRoom}) async {
    var x = ClassRoomPointer(
      classRoom.entityId,
      pointerPath: classRoom.collectionPath,
      pointerId: classRoom.entityId,
      lastTimeEdited: DateTime.now(),
      entityTyps: EntityTyps.Pointer,
      pointerTypes: HDMPointerTypes.ClassRoomPointer,
    );
    await classRoomPointer.add(x, ifRebeted: () {
      toast("you are alredy enroled in this org");
    });
    return x;
  }

  void widget({required OrgAccount orgAccount, required Organization org, required BuildContext context});

  factory OrgAccount.fromJson(Map<String, dynamic> json) {
    var x = OrgAccountType.values.firstWhere((element) => element.toString().split(".").last == json["orgAccountType"]);
    assert(x != null, "there is no orgAccountType parameter in ");
    switch (x) {
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
