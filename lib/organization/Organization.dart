import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/orgAccount/Role/Administrator.dart';
import 'package:lms/organization/orgAccount/Role/Owner.dart';
import 'package:lms/organization/orgAccount/Role/Parent.dart';
import 'package:lms/organization/orgAccount/Role/Student.dart';
import 'package:lms/organization/orgAccount/Role/Teacher.dart';

import 'ClassRoomPackage/ClassRoom.dart';
import 'GeneralModels/Entity/entity.dart';
import 'orgAccount/OrgAccount.dart';

part 'Organization.g.dart';

@JsonSerializable()
class Organization extends Entity {
  final String name;
  Organization(String entityId, {required this.name, required DateTime lastTimeEdited}) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: EntityTyps.Organization) {
    personal = HDMCollection<OrgAccount>(this, "personal");
    classroom = HDMCollection<ClassRoom>(this, "classroom");
  }

  //region  ClassRoom

  @JsonKey(ignore: true)
  late HDMCollection<ClassRoom> classroom;
  Future<ClassRoom> addClassroom(String entityId, {required String classRoomName}) async {
    var x = ClassRoom(entityId, lastTimeEdited: DateTime.now(), classRoomName: classRoomName);
    await classroom.add(x);
    return x;
  }

  //endregion
  //region   OrgAccount
  @JsonKey(ignore: true)
  late HDMCollection<OrgAccount> personal;

  Future<OrgAccount> addOwner(String entityId) async {
    var x = Owner(entityId, lastTimeEdited: DateTime.now(), orgAccountType: OrgAccountType.Owner, orgid: this.entityId);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addAdministrator(String entityId) async {
    var x = Administrator(entityId, lastTimeEdited: DateTime.now(), orgAccountType: OrgAccountType.Administrator, orgid: this.entityId);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addOrgAccount(String entityId) async {
    var x = Owner(entityId, lastTimeEdited: DateTime.now(), orgAccountType: OrgAccountType.Owner, orgid: this.entityId);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addTeacher(String entityId) async {
    var x = Teacher(entityId, lastTimeEdited: DateTime.now(), orgAccountType: OrgAccountType.Teacher, orgid: this.entityId, coursesList: []);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addStudent(String entityId) async {
    var x = Student(entityId, lastTimeEdited: DateTime.now(), orgAccountType: OrgAccountType.Student, orgid: this.entityId, classRoomList: []);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addParent(String entityId) async {
    var x = Parent(entityId, lastTimeEdited: DateTime.now(), orgAccountType: OrgAccountType.Parent, orgid: this.entityId);
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
