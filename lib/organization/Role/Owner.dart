import 'package:json_annotation/json_annotation.dart';
import 'package:lms/models/organization/Role/OrgAccount.dart';
import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/EmployeePackage/Employee.dart';
import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/StudentPackage/CollageStudent.dart';
import 'package:lms/mydirectory/organization/Role/OrgAccount.dart';

part 'Owner.g.dart';

@JsonSerializable(explicitToJson: true)
class Owner extends OrgAccount {
  List<Employee> currentemployee;
  List<CollageStudent> student;

  Owner({
    this.student,
    this.currentemployee,
    String type = "student",
    String orgid,
    List<String> eventpointer,
  }) : super(type: type, eventpointer: eventpointer, orgid: orgid);

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
