import 'package:flutter/material.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:x_bloc2/x_bloc2.dart';

class AdministratorController {
//region  Keys
  static const List<HDMKey<AdministratorController>> _keyList = [key1];
  late HDMMain<AdministratorController> data;
  void _start() => data = HDMMain<AdministratorController>(this, (HDMBox<AdministratorController> box) => _WidgetAdministrator(this, box), _keyList);
  static const HDMKey<AdministratorController> key1 = HDMKey<AdministratorController>();

//endregion
  final OrgAccount orgAccount;
  final Organization org;
  AdministratorController({required this.orgAccount, required this.org}) {
    _start();
  }
}

class _WidgetAdministrator extends HDMStatelessWidget<AdministratorController> {
  _WidgetAdministrator(AdministratorController app, HDMBox<AdministratorController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}
