//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/orgAccount/Role/Administrator.dart';
import 'package:lms/organization/orgAccount/Role/Owner.dart';
import 'package:lms/organization/orgAccount/Role/Parent.dart';
import 'package:lms/organization/orgAccount/Role/Student.dart';
import 'package:lms/organization/orgAccount/Role/Teacher.dart';

import '../Organization.dart';
import 'OrgAccount.dart';

part 'OrgUser.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class OrgUser extends ActivitySignetre {
  OrgUser(
    String entityId, {
    this.displayName,
    required DateTime lastTimeEdited,
    required EntityTyps entityTyps,
    required ActivitySignetreTyps activitySignetreTyps,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: entityTyps, activitySignetreTyps: activitySignetreTyps) {
    personal = HDMCollection<OrgAccount>(this, "personal");
  }
  String? displayName;
  @JsonKey(ignore: true)
  late Organization org;
  //region   OrgAccount
  static String _patrren = "~##~";
  static String idGenerator(Organization org) {
    return org.entityId + _patrren + DateTime.now().toString();
  }

  static String getOrgId(String s) {
    return s.split(_patrren).first;
  }

  static String getOrgUserId(String s) {
    return s;
  }

  @JsonKey(ignore: true)
  late HDMCollection<OrgAccount> personal;

  Future<OrgAccount> addOwner(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Owner;
    var x = Owner(orgAccountType.toString() + "-" + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: (this.theParent as Organization).entityId, uid: uid, entityTyps: EntityTyps.ActivitySignetre, activitySignetreTyps: ActivitySignetreTyps.OrgAccount);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addAdministrator(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Administrator;

    var x = Administrator(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: (this.theParent as Organization).entityId, uid: uid, entityTyps: EntityTyps.ActivitySignetre, activitySignetreTyps: ActivitySignetreTyps.OrgAccount);
    await personal.add(x);
    return x;
  }
  //
  // Future<OrgAccount> addOrgAccount(String uid) async {
  //   OrgAccountType orgAccountType = OrgAccountType.Owner;
  //
  //   var x = Owner(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: (this.theParent as Organization).entityId, uid: uid, entityTyps: EntityTyps.ActivitySignetre, activitySignetreTyps: ActivitySignetreTyps.OrgAccount);
  //   await personal.add(x);
  //   return x;
  // }

  Future<OrgAccount> addTeacher(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Teacher;

    var x = Teacher(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: (this.theParent as Organization).entityId, coursesList: [], uid: uid, entityTyps: EntityTyps.ActivitySignetre, activitySignetreTyps: ActivitySignetreTyps.OrgAccount);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addStudent(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Student;

    var x = Student(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: (this.theParent as Organization).entityId, classRoomList: [], uid: uid, entityTyps: EntityTyps.ActivitySignetre, activitySignetreTyps: ActivitySignetreTyps.OrgAccount);
    await personal.add(x);
    return x;
  }

  Future<OrgAccount> addParent(String uid) async {
    OrgAccountType orgAccountType = OrgAccountType.Parent;

    var x = Parent(orgAccountType.toString() + " - " + uid, lastTimeEdited: DateTime.now(), orgAccountType: orgAccountType, orgid: (this.theParent as Organization).entityId, uid: uid, entityTyps: EntityTyps.ActivitySignetre, activitySignetreTyps: ActivitySignetreTyps.OrgAccount);
    await personal.add(x);
    return x;
  }
  //endregion

  //region jsonApi
  factory OrgUser.fromJson(Map<String, dynamic> json) => _$OrgUserFromJson(json);
  Map<String, dynamic> toJson() => _$OrgUserToJson(this);
  //endregion
}
