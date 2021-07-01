import 'package:flutter/material.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:x_bloc2/x_bloc2.dart';

class ParentController {
//region  Keys
  static const List<HDMKey<ParentController>> _keyList = [key1];
  late HDMMain<ParentController> data;
  void _start() => data = HDMMain<ParentController>(this, (HDMBox<ParentController> box) => _WidgetParent(this, box), _keyList);
  static const HDMKey<ParentController> key1 = HDMKey<ParentController>();

//endregion
  final OrgAccount orgAccount;
  final Organization org;
  ParentController({required this.orgAccount, required this.org}) {
    _start();
  }
}

class _WidgetParent extends HDMStatelessWidget<ParentController> {
  _WidgetParent(ParentController app, HDMBox<ParentController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}
