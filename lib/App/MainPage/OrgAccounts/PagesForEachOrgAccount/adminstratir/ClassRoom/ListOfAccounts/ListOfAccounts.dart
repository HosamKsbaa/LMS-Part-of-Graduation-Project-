import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/MainPage/AccountsPage.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:x_bloc2/x_bloc2.dart';

class ListOfAccountsController {
//region  Keys
  static const List<HDMKey<ListOfAccountsController>> _keyList = [key1];
  late HDMMain<ListOfAccountsController> data;

  void _start() => data = HDMMain<ListOfAccountsController>(this, (HDMBox<ListOfAccountsController> box) => _WidgetListOfAccounts(this, box), _keyList);
  static const HDMKey<ListOfAccountsController> key1 = HDMKey<ListOfAccountsController>();

//endregion

  final ClassRoom classroom;
  final Organization org;
  final OrgAccount orgAccount;
  final OrgUser orguser;

  ListOfAccountsController({required this.classroom, required this.org, required this.orgAccount, required this.orguser}) {
    _start();
  }
  Future<void> addaUserToYouClassRoom(BuildContext context, OrgAccount addIt) async {
    await addIt.addAnClassRoomPointer(classRoom: classroom);
    await classroom.addOrgAccountPointer(addIt);

    //rguser
  }
}

class _WidgetListOfAccounts extends HDMStatelessWidget<ListOfAccountsController> {
  _WidgetListOfAccounts(ListOfAccountsController app, HDMBox<ListOfAccountsController> box) : super(app, box);

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
            onTap: () => app.addaUserToYouClassRoom(context, eS),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.account_box),
            title: Text(eS.orgAccountType.toString()),
          ),
        ),
      ),
    );
  }
}
