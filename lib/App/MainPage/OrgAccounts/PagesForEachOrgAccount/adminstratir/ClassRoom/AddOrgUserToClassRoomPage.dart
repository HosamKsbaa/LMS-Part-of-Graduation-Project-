import 'package:flutter/material.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/Owner/Owner.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/adminstratir/ClassRoom/InsideCoursePage.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgAccountPointer.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../../../AccountsPage.dart';

class AddOrgUserToClassRoomPageController {
//region  Keys
  static const List<HDMKey<AddOrgUserToClassRoomPageController>> _keyList = [key1];
  late HDMMain<AddOrgUserToClassRoomPageController> data;

  void _start() => data = HDMMain<AddOrgUserToClassRoomPageController>(this, (HDMBox<AddOrgUserToClassRoomPageController> box) => _WidgetAddOrgUserToClassRoomPage(this, box), _keyList);
  static const HDMKey<AddOrgUserToClassRoomPageController> key1 = HDMKey<AddOrgUserToClassRoomPageController>();

//endregion

  final OrgAccount orgAccount;
  final Organization org;
  ClassRoom? classroom;
  AddOrgUserToClassRoomPageController(this.classroom, {required this.orgAccount, required this.org}) {
    _start();
  }
}

class _WidgetAddOrgUserToClassRoomPage extends HDMStatelessWidget<AddOrgUserToClassRoomPageController> {
  _WidgetAddOrgUserToClassRoomPage(AddOrgUserToClassRoomPageController app, HDMBox<AddOrgUserToClassRoomPageController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD User to " + app.classroom!.classRoomName),
      ),
      body: HDMStreamBuilderForPointers<OrgAccountPointer, OrgAccount>(
        stream: app.classroom!.personalPointer.get(),
        err: () => ListTile(title: Text("err")),
        func: (obj, objPointer) => Card(
          child: ListTile(
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.school),
            title: Text(show((obj.theParent as OrgUser), app.orgAccount)),
            subtitle: Appcntroler.timeAgo(obj),
            //subtitle: Text(r!.),
          ),
        ),
        loading: () => ListTile(
          title: Text("err"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          hDMNavigatorPush(context, InsideCoursePageController(app.classroom!, app.org, app.orgAccount).data.play);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
