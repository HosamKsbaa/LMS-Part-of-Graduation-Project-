import 'package:flutter/material.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:x_bloc2/x_bloc2.dart';

class AddAccountsToOrgUserController {
//region  Keys
  static const List<HDMKey<AddAccountsToOrgUserController>> _keyList = [key1];
  late HDMMain<AddAccountsToOrgUserController> data;
  void _start() => data = HDMMain<AddAccountsToOrgUserController>(this, (HDMBox<AddAccountsToOrgUserController> box) => _WidgetAddAccountsToOrgUser(this, box), _keyList);
  static const HDMKey<AddAccountsToOrgUserController> key1 = HDMKey<AddAccountsToOrgUserController>();

//endregion

  AddAccountsToOrgUserController(this.ownerAccount, {required this.orgUser}) {
    _start();
  }
  final OrgUser orgUser;
  final OrgAccount ownerAccount;

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
      appBar: AppBar(
        title: Row(
          children: [Padding(padding: EdgeInsets.only(right: 5), child: Icon(Icons.info)), Text("Add a User")],
        ),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              onTap: () => app.addOwner(context),
              //enabled: false,
              trailing: Icon(Icons.add),
              title: Text("Add Owner"),
              leading: Image(image: AssetImage("assets/owner.png")),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => app.addAdministrator(context),

              trailing: Icon(Icons.add),
              title: Text("Add Admin"),
              //   subtitle: Text("Look Up By code"),
              leading: Image(image: AssetImage("assets/admin.png")),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => app.addTeacher(context),
              trailing: Icon(Icons.add),
              title: Text("Add Teacher"),
              leading: Image(image: AssetImage("assets/teacher.png")),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => app.addStudent(context),

              trailing: Icon(Icons.add),
              title: Text("Add Student"),
              //   subtitle: Text("Look Up By code"),
              leading: Image(
                image: AssetImage("assets/student.png"),
              ),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () => app.addParent(context),

              trailing: Icon(Icons.add),
              title: Text("Add Parent"),
              //  subtitle: Text("Look Up By code"),
              leading: Image(image: AssetImage("assets/parent.png")),
            ),
          )
        ],
      ),
    );
  }
}
