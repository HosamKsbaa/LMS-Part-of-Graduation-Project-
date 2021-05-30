import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

class AddAnOrgController {
//region  Keys
  static const List<HDMKey<AddAnOrgController>> _keyList = [key1];
  HDMMain<AddAnOrgController> data;

  void _start() => data = HDMMain<AddAnOrgController>(this, (HDMBox box) => _WidgetAddAnOrg(this, box), _keyList);
  static const HDMKey<AddAnOrgController> key1 = HDMKey<AddAnOrgController>();

//endregion
  AddAnOrgController() {
    _start();
  }
  void nextStepOrg() {}
  void nextStepclass() {}
}

class _WidgetAddAnOrg extends HDMStatelessWidget<AddAnOrgController> {
  _WidgetAddAnOrg(AddAnOrgController app, HDMBox box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              enabled: false,
              trailing: Icon(Icons.business_outlined),
              title: Text("Create A new organization"),
              leading: Icon(Icons.add),
            ),
          ),
          Card(
            child: ListTile(
              enabled: false,
              trailing: Icon(Icons.business_outlined),
              title: Text("Join An existing organization"),
              subtitle: Text("Look Up By code"),
              leading: Icon(Icons.search_off),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(Icons.pending_actions),
              title: Text("Create A new classroom"),
              leading: Icon(Icons.add),
            ),
          ),
          Card(
            child: ListTile(
              trailing: Icon(Icons.pending_actions),
              title: Text("Join An existing classroom"),
              subtitle: Text("Look Up By code"),
              leading: Icon(Icons.search_off),
            ),
          )
        ],
      ),
    );
  }
}
