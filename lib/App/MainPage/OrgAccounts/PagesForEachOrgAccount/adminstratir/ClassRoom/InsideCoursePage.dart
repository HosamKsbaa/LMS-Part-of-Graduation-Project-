import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/AccountsPage.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/Owner/Owner.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/adminstratir/ClassRoom/ListOfAccounts/ListOfAccounts.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

class InsideCoursePageController {
//region  Keys
  static const List<HDMKey<InsideCoursePageController>> _keyList = [key1];
  late HDMMain<InsideCoursePageController> data;

  void _start() => data = HDMMain<InsideCoursePageController>(this, (HDMBox<InsideCoursePageController> box) => _WidgetInsideCoursePage(this, box), _keyList);
  static const HDMKey<InsideCoursePageController> key1 = HDMKey<InsideCoursePageController>();

//endregion
  final ClassRoom classroom;
  final Organization org;
  final OrgAccount orgAccount;
  InsideCoursePageController(this.classroom, this.org, this.orgAccount) {
    _start();
  }
}

class _WidgetInsideCoursePage extends HDMStatelessWidget<InsideCoursePageController> {
  _WidgetInsideCoursePage(InsideCoursePageController app, HDMBox<InsideCoursePageController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text("Administrator in ${app.org.name} org"),
      ),
      body: HDMStreamBuilder<OrgUser>(
        stream: app.org.orgUser.get(),
        func: (eS) => Card(
          child: ListTile(
            onTap: () async {
              hDMNavigatorPush(context, ListOfAccountsController(orguser: eS, orgAccount: app.orgAccount, org: app.org, classroom: app.classroom).data.play);
            },
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.folder_shared_rounded),
            title: Text(show(eS, app.orgAccount)),
            subtitle: Appcntroler.timeAgo(eS),
          ),
        ),
      ),
    );
  }
}
