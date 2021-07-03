import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../../../AccountsPage.dart';
import '../Owner.dart';
import '_/AddAccountsToOrgUser.dart';

class OrgUserListOfAccountsController {
//region  Keys
  static const List<HDMKey<OrgUserListOfAccountsController>> _keyList = [key1];
  late HDMMain<OrgUserListOfAccountsController> data;
  void _start() => data = HDMMain<OrgUserListOfAccountsController>(this, (HDMBox<OrgUserListOfAccountsController> box) => _WidgetOrgUserListOfAccounts(this, box), _keyList);
  static const HDMKey<OrgUserListOfAccountsController> key1 = HDMKey<OrgUserListOfAccountsController>();

//endregion
  final OrgAccount ownerAccount;

  final OrgUser orgUser;

  OrgUserListOfAccountsController(this.ownerAccount, {required this.orgUser}) {
    _start();
  }
  void addAccount(BuildContext context) {
    hDMNavigatorPush(context, AddAccountsToOrgUserController(ownerAccount, orgUser: orgUser).data.play);
  }
}

class _WidgetOrgUserListOfAccounts extends HDMStatelessWidget<OrgUserListOfAccountsController> {
  _WidgetOrgUserListOfAccounts(OrgUserListOfAccountsController app, HDMBox<OrgUserListOfAccountsController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text(show(app.orgUser, app.ownerAccount)),
      ),
      body: HDMStreamBuilder<OrgAccount>(
        stream: app.orgUser.personal.get(),
        func: (eS) => Card(
          child: ListTile(
            subtitle: Appcntroler.timeAgo(eS),
            // onTap: () {
            //   hDMNavigatorPush(context, OrgAccountsController(hdmPointer: orgPointer, org: Org).data.play);
            // },
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.agriculture_outlined),
            title: Text(eS.orgAccountType.toString()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => app.addAccount(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
