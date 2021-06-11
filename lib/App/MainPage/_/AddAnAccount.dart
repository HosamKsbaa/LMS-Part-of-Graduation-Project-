

import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

class _Account {
  final String name;
  final Icon icon;
  final Function create;

  _Account(this.name, this.icon, this.create);
}

class AddAnAccountController {
//region  Keys
  static const List<HDMKey<AddAnAccountController>> _keyList = [key1];
  HDMMain<AddAnAccountController>? data;

  void _start() => data = HDMMain<AddAnAccountController>(this, (HDMBox box) => _WidgetAddAnAccount(this, box), _keyList);
  static const HDMKey<AddAnAccountController> key1 = HDMKey<AddAnAccountController>();

//endregion
  AddAnAccountController() {
    _start();
  }
  void createAccount() {}
  void createAdministrator() {}
  void createTeachingStaff() {}
  void createCollegeStudent() {}
  void createCollageParent() {}
  late List<_Account> allChoices;
}

class _WidgetAddAnAccount extends HDMStatelessWidget<AddAnAccountController> {
  _WidgetAddAnAccount(AddAnAccountController app, HDMBox box) : super(app, box as HDMBox<AddAnAccountController>);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(itemBuilder: (context, i) {
        _Account account = app.allChoices[i];
        return ListTile(title: Text(account.name), leading: account.icon, onTap: account.create as void Function()?);
      }),
    );
  }
}
