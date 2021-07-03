import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../../../AccountsPage.dart';

class ClassRoomController {
//region  Keys
  static const List<HDMKey<ClassRoomController>> _keyList = [key1];
  late HDMMain<ClassRoomController> data;
  void _start() => data = HDMMain<ClassRoomController>(this, (HDMBox<ClassRoomController> box) => _WidgetClassRoom(this, box), _keyList);
  static const HDMKey<ClassRoomController> key1 = HDMKey<ClassRoomController>();

//endregion
  ClassRoomController() {
    _start();
  }
}

class _WidgetClassRoom extends HDMStatelessWidget<ClassRoomController> {
  _WidgetClassRoom(ClassRoomController app, HDMBox<ClassRoomController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text("Administrator in ${app.org.name} org"),
      ),
      body: HDMStreamBuilder<ClassRoom>(
        stream: app.org.classroom.get(),
        func: (eS) => Card(
          child: ListTile(
            subtitle: Appcntroler.timeAgo(eS),
            onTap: () {
              hDMNavigatorPush(context, AddOrgUserToClassRoomPageController(eS, org: app.org, orgAccount: app.orgAccount).data.play);
            },
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.folder_shared_rounded),
            title: Text(eS.classRoomName),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => app.addNewCourse(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
