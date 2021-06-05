import 'Administrator.dart';
import 'Owner.dart';
import 'Parent.dart';
import 'Student.dart';
import 'Teacher.dart';

abstract class OrgAccount {
  final String orgid;
  final List<String> eventpointer;
  final String type;

  OrgAccount({this.eventpointer, this.orgid, this.type});

  factory OrgAccount.fromJson(Map<String, dynamic> json) {
    if (json["type"] == "student")
      return Student.fromJson(json);
    else if (json["type"] == "parent")
      return Parent.fromJson(json);
    else if (json["type"] == "administrator")
      return Administrator.fromJson(json);
    else if (json["type"] == "teacher")
      return Teacher.fromJson(json);
    else if (json["type"] == "owner")
      return Owner.fromJson(json);
    else
      throw {"Error undefined OrgAccount type"};
  }
  Map<String, dynamic> toJson();
}
