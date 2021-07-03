import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../../AccountsPage.dart';
import 'OrgUserListOfAccounts/OrgUserListOfAccounts.dart';

String show(OrgUser e, OrgAccount a) {
  if (e.entityId == a.theParent!.entityId) {
    return "Me";
  } else if (e.displayName == null) {
    return "Not Connected" + e.lastTimeEdited.toString();
  } else {
    return e.displayName!;
  }
}

class OwnerController {
//region  Keys
  static const List<HDMKey<OwnerController>> _keyList = [key1];
  late HDMMain<OwnerController> data;
  void _start() => data = HDMMain<OwnerController>(this, (HDMBox<OwnerController> box) => _WidgetOwner(this, box), _keyList);
  static const HDMKey<OwnerController> key1 = HDMKey<OwnerController>();

//endregion
  final OrgAccount ownerAccount;
  final Organization org;
  OwnerController({required this.ownerAccount, required this.org}) {
    _start();
  }
  void inviteAnewUserToTheOrg(BuildContext context) {
    String id = OrgUser.idGenerator(org);
    org.addAOrgUser(id);
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Click On this text to add to you clip board ",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: new Tooltip(preferBelow: false, message: "Copy", child: new Text(id)),
                          onTap: () {
                            Clipboard.setData(new ClipboardData(text: id));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class _WidgetOwner extends HDMStatelessWidget<OwnerController> {
  _WidgetOwner(OwnerController app, HDMBox<OwnerController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text("Owner of ${app.org.name}"),
      ),
      body: HDMStreamBuilder<OrgUser>(
        stream: app.org.orgUser.get(),
        func: (eS) => Card(
          child: ListTile(
            subtitle: Appcntroler.timeAgo(eS),
            onTap: () {
              hDMNavigatorPush(context, OrgUserListOfAccountsController(app.ownerAccount, orgUser: eS).data.play);
            },
            trailing: Icon(Icons.arrow_forward_ios_rounded),

            leading: Icon(Icons.verified_user),
            title: Text(show(eS, app.ownerAccount)),

            //subtitle: Text(r!.),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => app.inviteAnewUserToTheOrg(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
