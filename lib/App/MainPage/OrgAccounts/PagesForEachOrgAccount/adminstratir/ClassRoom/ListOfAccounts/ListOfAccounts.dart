import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/MainPage/AccountsPage.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:x_bloc2/x_bloc2.dart';


class ListOfAccountsController {
//region  Keys
  static const List<HDMKey<ListOfAccountsController>> _keyList = [key1];
  late HDMMain<ListOfAccountsController> data;

  void _start() =>
      data = HDMMain<ListOfAccountsController>(
          this, (HDMBox<ListOfAccountsController> box) =>
          _WidgetListOfAccounts(this, box), _keyList);
  static const HDMKey<ListOfAccountsController> key1 = HDMKey<
      ListOfAccountsController>();

//endregion

  OrgUser  orguser;
  ListOfAccountsController({required this.orguser}) {
    _start();
  }
}


class _WidgetListOfAccounts
    extends HDMStatelessWidget<ListOfAccountsController> {
  _WidgetListOfAccounts(ListOfAccountsController app,
      HDMBox<ListOfAccountsController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text("emails of ${app.orguser.displayName} user"),
      ),
      body: HDMStreamBuilder<OrgAccount>(
        stream: app.orguser.personal.get(),
        func: (eS) => Card(
          child: ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.account_box),
            title: Text(eS.orgAccountType.toString()),
          ),
        ),
      ),
    );
  }
}