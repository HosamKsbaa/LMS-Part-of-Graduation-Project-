import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/orgAccount/Role/Administrator.dart';
import 'package:lms/organization/orgAccount/Role/Owner.dart';
import 'package:lms/organization/orgAccount/Role/Parent.dart';
import 'package:lms/organization/orgAccount/Role/Student.dart';
import 'package:lms/organization/orgAccount/Role/Teacher.dart';

import 'ClassRoomPackage/ClassRoom.dart';
import 'GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'GeneralModels/Entity/entity.dart';
import 'orgAccount/OrgAccount.dart';

part 'Organization.g.dart';

@JsonSerializable()
class Organization extends Entity {
  final String name;
  Organization(String entityId, {required this.name, required DateTime lastTimeEdited, entityTyps: EntityTyps.orgAccountPointer}) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: EntityTyps.Organization) {
    personal = HDMCollection<OrgAccount>(this, "personal");
    classroom = HDMCollection<ClassRoom>(this, "classroom");
  }

  //region  ClassRoom

  @JsonKey(ignore: true)
  late HDMCollection<ClassRoom> classroom;
  Future<ClassRoom> addClassroom(String uid, {required String classRoomName}) async {
    var x = ClassRoom(entityId, lastTimeEdited: DateTime.now(), classRoomName: classRoomName, activitySignetreTyps: ActivitySignetreTyps.ClassRoom, entityTyps: EntityTyps.ActivitySignetre);
    await classroom.add(x);
    return x;
  }

  //endregion
  //region   OrgAccount
  @JsonKey(ignore: true)
  late HDMCollection<OrgAccount> personal;

  Future<OrgAccount> addOwner(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Owner;
    var x = Owner(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: this.entityId, uid: uid, entityTyps: EntityTyps.ActivitySignetre);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addAdministrator(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Administrator;

    var x = Administrator(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: this.entityId, uid: uid, entityTyps: EntityTyps.ActivitySignetre);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addOrgAccount(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Owner;

    var x = Owner(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: this.entityId, uid: uid, entityTyps: EntityTyps.ActivitySignetre);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addTeacher(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Teacher;

    var x = Teacher(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: this.entityId, coursesList: [], uid: uid, entityTyps: EntityTyps.ActivitySignetre);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addStudent(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Student;

    var x = Student(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: this.entityId, classRoomList: [], uid: uid, entityTyps: EntityTyps.ActivitySignetre);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addParent(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Parent;

    var x = Parent(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: this.entityId, uid: uid, entityTyps: EntityTyps.ActivitySignetre);
    await personal.add(x);
    return x;
  }
  //endregion

  @override
  void firstTimeInit() {}

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }

  @override
  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
//endregion
}
