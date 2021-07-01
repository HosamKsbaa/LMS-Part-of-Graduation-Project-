import 'package:flutter/material.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:x_bloc2/x_bloc2.dart';

class StudentController {
//region  Keys
  static const List<HDMKey<StudentController>> _keyList = [key1];
  late HDMMain<StudentController> data;
  void _start() => data = HDMMain<StudentController>(this, (HDMBox<StudentController> box) => _WidgetStudent(this, box), _keyList);
  static const HDMKey<StudentController> key1 = HDMKey<StudentController>();

//endregion
  final OrgAccount orgAccount;
  final Organization org;
  StudentController({required this.orgAccount, required this.org}) {
    _start();
  }
}

class _WidgetStudent extends HDMStatelessWidget<StudentController> {
  _WidgetStudent(StudentController app, HDMBox<StudentController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}
