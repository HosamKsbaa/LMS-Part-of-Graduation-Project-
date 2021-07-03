import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/AccountsPage.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/adminstratir/ClassRoom/AddOrgUserToClassRoomPage.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/adminstratir/ClassRoom/InsideCoursePage.dart';
// import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/adminstratir/ClassRoomList/ClassRoomList.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

class AdministratorController {
//region  Keys
  static const List<HDMKey<AdministratorController>> _keyList = [key1];
  late HDMMain<AdministratorController> data;

  void _start() => data = HDMMain<AdministratorController>(this, (HDMBox<AdministratorController> box) => _WidgetAdministrator(this, box), _keyList);
  static const HDMKey<AdministratorController> key1 = HDMKey<AdministratorController>();

//endregion
  final OrgAccount orgAccount;
  final Organization org;
  ClassRoom? Addedclassroom;

  AdministratorController({required this.orgAccount, required this.org}) {
    _start();
  }
  void addNewCourse(BuildContext context) {
    String id = orgAccount.uid + DateTime.now().toString();
    final _key = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) async {
                          Addedclassroom = await org.addClassroom(id, classRoomName: value!);
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              Navigator.pop(context);
                            }
                          },
                          // key: _key,
                          child: Text("submit"))
                    ],
                  ))
            ],
            title: Text("create new ClassRoom"),
          );
        });
  }
}

class _WidgetAdministrator extends HDMStatelessWidget<AdministratorController> {
  _WidgetAdministrator(AdministratorController app, HDMBox<AdministratorController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
