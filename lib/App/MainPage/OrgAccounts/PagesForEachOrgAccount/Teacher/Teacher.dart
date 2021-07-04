import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/Teacher/CourseContent.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoomPointer.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../../AccountsPage.dart';

class TeacherController {
//region  Keys
  static const List<HDMKey<TeacherController>> _keyList = [key1];
  late HDMMain<TeacherController> data;
  void _start() => data = HDMMain<TeacherController>(this, (HDMBox<TeacherController> box) => _WidgetTeacher(this, box), _keyList);
  static const HDMKey<TeacherController> key1 = HDMKey<TeacherController>();

//endregion
  final OrgAccount orgAccount;
  final Organization org;
  TeacherController({required this.orgAccount, required this.org}) {
    _start();
  }
}

class _WidgetTeacher extends HDMStatelessWidget<TeacherController> {
  _WidgetTeacher(TeacherController app, HDMBox<TeacherController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text("All orgnizationn"),
      ),
//body: StreamBuilder<List<UserPriviteDate>>(stream: TheApp.appcntroler.userPriviteDateColl.get(), builder: (context, obj) {}),
      body: HDMStreamBuilderForPointers<ClassRoomPointer, ClassRoom>(
        stream: app.orgAccount.classRoomPointer.get(),
        err: () => ListTile(title: Text("err")),
        func: (classRoom, classRoomPointer) => Card(
          child: ListTile(
            onTap: () {
              hDMNavigatorPush(context, CourseContentController(classRoom).data.play);
            },
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.school),
            title: Text(classRoom.classRoomName),
            subtitle: Appcntroler.timeAgo(classRoom),
            //subtitle: Text(r!.),
          ),
        ),
        loading: () => ListTile(
          title: Text("err"),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: app.addAccount,
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
