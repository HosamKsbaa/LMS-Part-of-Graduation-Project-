import 'package:flutter/material.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:x_bloc2/x_bloc2.dart';

class TeacherController {
//region  Keys
  static const List<HDMKey<TeacherController>> _keyList = [key1];
  late HDMMain<TeacherController> data;
  void _start() => data = HDMMain<TeacherController>(this, (HDMBox<TeacherController> box) => _WidgetTeacher(this, box), _keyList);
  static const HDMKey<TeacherController> key1 = HDMKey<TeacherController>();

//endregion
  final OrgAccount orgAccount;
  final Organization org;
  TeacherController({required this.orgAccount, required this.org}) {
    _start();
  }
}

class _WidgetTeacher extends HDMStatelessWidget<TeacherController> {
  _WidgetTeacher(TeacherController app, HDMBox<TeacherController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}
