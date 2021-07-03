import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoomPointer.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../../AccountsPage.dart';

class StudentController {
//region  Keys
  static const List<HDMKey<StudentController>> _keyList = [key1];
  late HDMMain<StudentController> data;
  void _start() => data = HDMMain<StudentController>(this, (HDMBox<StudentController> box) => _WidgetStudent(this, box), _keyList);
  static const HDMKey<StudentController> key1 = HDMKey<StudentController>();

//endregion
  final OrgAccount orgAccount;
  final Organization org;
  StudentController({required this.orgAccount, required this.org}) {
    _start();
  }
}

class _WidgetStudent extends HDMStatelessWidget<StudentController> {
  _WidgetStudent(StudentController app, HDMBox<StudentController> box) : super(app, box);

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
            // onTap: () {
            //   hDMNavigatorPush(context, OrgAccountsController(orgnizationPointer: orgPointer, org: Org).data.play);
            // },
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
