import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/OrgnizationPointer.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../AccountsPage.dart';

class OrgAccountsController {
//region  Keys
  static const List<HDMKey<OrgAccountsController>> _keyList = [key1];
  late HDMMain<OrgAccountsController> data;

  void _start() => data = HDMMain<OrgAccountsController>(this, (HDMBox<OrgAccountsController> box) => _WidgetOrgAccounts(this, box), _keyList);
  static const HDMKey<OrgAccountsController> key1 = HDMKey<OrgAccountsController>();

//endregion
  final Organization org;
  final OrgnizationPointer orgnizationPointer;
  OrgAccountsController({required this.org, required this.orgnizationPointer}) {
    _start();
  }
}

class _WidgetOrgAccounts extends HDMStatelessWidget<OrgAccountsController> {
  _WidgetOrgAccounts(OrgAccountsController app, HDMBox<OrgAccountsController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text("Accounts "),
      ),
//body: StreamBuilder<List<UserPriviteDate>>(stream: TheApp.appcntroler.userPriviteDateColl.get(), builder: (context, obj) {}),

      body: FutureBuilder<OrgUser?>(
          future: app.org.orgUser.getValLocaly(app.orgnizationPointer.orgUserCode),
          builder: (context, snapshot) {
            print(1);
            if (snapshot.hasError) {
              throw {snapshot.error};
            } else {
              print(2);
              var orgUser = snapshot.data;

              if (orgUser != null) {
                print(2.toString() + "Susses");
                return HDMStreamBuilder<OrgAccount>(
                  stream: orgUser.personal.get(),
                  func: (orgAccount) => Card(
                    child: ListTile(
                      subtitle: Appcntroler.timeAgo(orgAccount),
                      onTap: () => orgAccount.widget(orgAccount: orgAccount, org: app.org, context: context),

                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      leading: Icon(Icons.supervised_user_circle),

                      title: Text(orgAccount.orgAccountType.toString().split(".").last),
                      //subtitle: Text(r!.),
                    ),
                  ),
                );
              } else {
                print(2.toString() + "fail");

                return CirclerWaiting();
              }
            }
          }),
    );
  }
}
