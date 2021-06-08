import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';

import '../OrgAccount.dart';

part 'Teacher.g.dart';

@JsonSerializable()
class Teacher extends OrgAccount {
  List<ClassRoom> coursesList;

  Teacher({
    this.coursesList,
    type = "student",
    String orgid,
    List<String> eventpointer,
  }) : super(type: type, eventpointer: eventpointer, orgid: orgid);

  factory Teacher.fromJson(Map<String, dynamic> json) => _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);
}
