import 'package:flutter/material.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:x_bloc2/x_bloc2.dart';

class AddAccountsToOrgUserController {
//region  Keys
  static const List<HDMKey<AddAccountsToOrgUserController>> _keyList = [key1];
  late HDMMain<AddAccountsToOrgUserController> data;
  void _start() => data = HDMMain<AddAccountsToOrgUserController>(this, (HDMBox<AddAccountsToOrgUserController> box) => _WidgetAddAccountsToOrgUser(this, box), _keyList);
  static const HDMKey<AddAccountsToOrgUserController> key1 = HDMKey<AddAccountsToOrgUserController>();

//endregion

  AddAccountsToOrgUserController({required this.orgUser}) {
    _start();
  }
  final OrgUser orgUser;

  void popOff(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void addOwner(BuildContext context) {
    orgUser.addOwner(orgUser.entityId);
    popOff(context);
  }

  void addAdministrator(BuildContext context) {
    orgUser.addAdministrator(orgUser.entityId);
    popOff(context);
  }

  void addParent(BuildContext context) {
    orgUser.addParent(orgUser.entityId);
    popOff(context);
  }

  void addTeacher(BuildContext context) {
    orgUser.addTeacher(orgUser.entityId);
    popOff(context);
  }

  void addStudent(BuildContext context) {
    orgUser.addStudent(orgUser.entityId);
    popOff(context);
  }
}

class _WidgetAddAccountsToOrgUser extends HDMStatelessWidget<AddAccountsToOrgUserController> {
  _WidgetAddAccountsToOrgUser(AddAccountsToOrgUserController app, HDMBox<AddAccountsToOrgUserController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              onTap: () => app.addOwner(context),
              //enabled: false,
              trailing: Icon(Icons.business_outlined),
              title: Text("Add Owner"),
              leading: Icon(Icons.add),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => app.addAdministrator(context),

              enabled: false,
              trailing: Icon(Icons.business_outlined),
              title: Text("Add Admin"),
              //   subtitle: Text("Look Up By code"),
              leading: Icon(Icons.search_off),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => app.addTeacher(context),
              trailing: Icon(Icons.pending_actions),
              title: Text("Add Teacher"),
              leading: Icon(Icons.add),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => app.addStudent(context),

              trailing: Icon(Icons.pending_actions),
              title: Text("Add Student"),
              //   subtitle: Text("Look Up By code"),
              leading: Icon(Icons.search_off),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => app.addParent(context),

              trailing: Icon(Icons.pending_actions),
              title: Text("Add Parent"),
              //  subtitle: Text("Look Up By code"),
              leading: Icon(Icons.search_off),
            ),
          )
        ],
      ),
    );
  }
}
