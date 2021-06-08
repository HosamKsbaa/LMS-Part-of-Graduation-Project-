import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';

import '../OrgAccount.dart';

part 'Student.g.dart';

@JsonSerializable()
class Student extends OrgAccount {
  final List<ClassRoom> classRoomList;

  Student(
    this.classRoomList, {
    String type = "student",
    String orgid,
    List<String> eventpointer,
  }) : super(type: type, eventpointer: eventpointer, orgid: orgid);

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
