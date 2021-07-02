import 'package:flutter/material.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '_/AddAnAccount.dart';
import '_/AddOrgInffo.dart';

class AddAnOrgController {
//region  Keys
  static const List<HDMKey<AddAnOrgController>> _keyList = [key1];
  late HDMMain<AddAnOrgController> data;

  void _start() => data = HDMMain<AddAnOrgController>(this, (HDMBox box) => _WidgetAddAnOrg(this, box), _keyList);
  static const HDMKey<AddAnOrgController> key1 = HDMKey<AddAnOrgController>();

//endregion
  AddAnOrgController() {
    _start();
  }
  void nextStepOrg() {}
  void nextStepclass() {}

  Future<void> CreatAnOrg(String orgName) async {}

  void AddAClass(String classRoom) {}

  Future<void> addAmOrgnization(BuildContext context) async {
    hDMNavigatorPush(context, AddOrgInffoController().data.play);
  }

  Future<void> ConnectToOrg(BuildContext context) async {
    hDMNavigatorPush(context, AddAnAccountController().data.play);
  }
}

class _WidgetAddAnOrg extends HDMStatelessWidget<AddAnOrgController> {
  _WidgetAddAnOrg(AddAnOrgController app, HDMBox box) : super(app, box as HDMBox<AddAnOrgController>);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              onTap: () => app.addAmOrgnization(context),
              //enabled: false,
              trailing: Icon(Icons.business_outlined),
              title: Text("Create A new organization"),
              leading: Icon(Icons.add),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => app.ConnectToOrg(context),
              trailing: Icon(Icons.business_outlined),
              title: Text("Join An existing organization"),
              subtitle: Text("Look Up By code"),
              leading: Icon(Icons.search_off),
            ),
          ),
          // Card(
          //   child: ListTile(
          //     trailing: Icon(Icons.pending_actions),
          //     title: Text("Create A new classroom"),
          //     leading: Icon(Icons.add),
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     trailing: Icon(Icons.pending_actions),
          //     title: Text("Join An existing classroom"),
          //     subtitle: Text("Look Up By code"),
          //     leading: Icon(Icons.search_off),
          //   ),
          // )
        ],
      ),
    );
  }
}
