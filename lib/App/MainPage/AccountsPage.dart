import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/GeneralMethouds/Navigation.dart';
import 'package:lms/models/userOrganizationAccountPackage/UserOrganizationAccount.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '_/AddAnOrg.dart';

class AccountsPageController {
//region  Keys
  static const List<HDMKey<AccountsPageController>> _keyList = [key1];
  HDMMain<AccountsPageController> data;

  void _start() => data = HDMMain<AccountsPageController>(this, (HDMBox box) => _WidgetAccountsPage(this, box), _keyList);
  static const HDMKey<AccountsPageController> key1 = HDMKey<AccountsPageController>();

//endregion
  AccountsPageController() {
    _start();
  }
  BuildContext _context;
  List<UserOrganizationAccount> accounts = [];
  void addAccount() {
    hDMNavigatorPush(_context, AddAnOrgController().data.play);
  }
}

class _WidgetAccountsPage extends HDMStatelessWidget<AccountsPageController> {
  _WidgetAccountsPage(AccountsPageController app, HDMBox box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    app._context = context;

    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: app.addAccount,
        child: Icon(Icons.add),
      ),
    );
  }
}
