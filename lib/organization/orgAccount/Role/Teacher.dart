import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';

import '../OrgAccount.dart';

part 'Teacher.g.dart';

@JsonSerializable()
class Teacher extends OrgAccount {
  List<ClassRoom> coursesList;

  Teacher({
    this.coursesList,
    type = "teacher",
    String orgid,
    List<String> eventpointer,
  });

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
