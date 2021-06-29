import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';

import '../OrgAccount.dart';

part 'Teacher.g.dart';

@JsonSerializable()
class Teacher extends OrgAccount {
  List<ClassRoom> coursesList;

  Teacher(
    String entityId, {
    required this.coursesList,
    required OrgAccountType orgAccountType,
    required String orgid,
    required String uid,
    required DateTime lastTimeEdited,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, orgAccountType: OrgAccountType.Teacher, orgid: orgid, uid: uid);

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
}
