import 'package:json_annotation/json_annotation.dart';
import 'package:lms/mydirectory/organization/Role/OrgAccount.dart';

part 'Student.g.dart';

@JsonSerializable()
class Student extends OrgAccount {
  List<StudentCourseLog> list_of_donestudent;

  Student({
    this.list_of_donestudent,
    String type = "student",
    String orgid,
    List<String> eventpointer,
  }) : super(type: type, eventpointer: eventpointer, orgid: orgid);

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
