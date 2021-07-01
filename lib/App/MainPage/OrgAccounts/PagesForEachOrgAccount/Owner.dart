import 'package:flutter/material.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:x_bloc2/x_bloc2.dart';

class OwnerController {
//region  Keys
  static const List<HDMKey<OwnerController>> _keyList = [key1];
  late HDMMain<OwnerController> data;
  void _start() => data = HDMMain<OwnerController>(this, (HDMBox<OwnerController> box) => _WidgetOwner(this, box), _keyList);
  static const HDMKey<OwnerController> key1 = HDMKey<OwnerController>();

//endregion
  final OrgAccount orgAccount;
  final Organization org;
  OwnerController({required this.orgAccount, required this.org}) {
    _start();
  }
}

class _WidgetOwner extends HDMStatelessWidget<OwnerController> {
  _WidgetOwner(OwnerController app, HDMBox<OwnerController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}
