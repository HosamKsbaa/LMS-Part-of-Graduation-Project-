import 'package:flutter/material.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/adminstratir/ClassRoom/InsideCoursePage.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:x_bloc2/x_bloc2.dart';


class AddOrgUserToClassRoomPageController {
//region  Keys
  static const List<HDMKey<AddOrgUserToClassRoomPageController>> _keyList = [
    key1
  ];
  late HDMMain<AddOrgUserToClassRoomPageController> data;

  void _start() =>
      data = HDMMain<AddOrgUserToClassRoomPageController>(
          this, (HDMBox<AddOrgUserToClassRoomPageController> box) =>
          _WidgetAddOrgUserToClassRoomPage(this, box), _keyList);
  static const HDMKey<AddOrgUserToClassRoomPageController> key1 = HDMKey<
      AddOrgUserToClassRoomPageController>();

//endregion

  final OrgAccount orgAccount;
  final Organization org;
  ClassRoom? classroom;
  AddOrgUserToClassRoomPageController(this.classroom , {required this.orgAccount,required this.org}) {
    _start();
  }
}


class _WidgetAddOrgUserToClassRoomPage
    extends HDMStatelessWidget<AddOrgUserToClassRoomPageController> {
  _WidgetAddOrgUserToClassRoomPage(AddOrgUserToClassRoomPageController app,
      HDMBox<AddOrgUserToClassRoomPageController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD User to "+app.classroom!.classRoomName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Click on the "),
                  Icon(Icons.add_circle_outline),
                  Text(" button below to add user in classroom"),
                ],
              ),
            ),
            Icon(Icons.arrow_downward_outlined ,size: 30,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          hDMNavigatorPush(context, InsideCoursePageController(app.classroom!,  app.org, app.orgAccount).data.play);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}