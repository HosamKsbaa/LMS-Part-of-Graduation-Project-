import 'package:json_annotation/json_annotation.dart';

import 'OrgAccount.dart';

part 'Administrator.g.dart';

@JsonSerializable(explicitToJson: true)
class Administrator extends OrgAccount {
  Administrator({
    String type = "student",
    String orgid,
    List<String> eventpointer,
  }) : super(type: type, eventpointer: eventpointer, orgid: orgid);
  //
  // void addAstudent(CollageStudent student) {
  //   this.personalHandler.students.add(student);
  // }
  //
  // void kickStudent(CollageStudent student) {
  //   this.personalHandler.students.remove(student);
  // }
  //
  // void enrollaTeacher(Employee teacher) {
  //   this.personalHandler.Teacher.add(teacher);
  // }
  //
  // void kickTeacher(Employee teacher) {
  //   this.personalHandler.Teacher.remove(teacher);
  // }

  factory Administrator.fromJson(Map<String, dynamic> json) => _$AdministratorFromJson(json);

  Map<String, dynamic> toJson() => _$AdministratorToJson(this);
}
