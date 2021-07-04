import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/CourseMaterialBlock.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../../AccountsPage.dart';
import 'AddAQize/CreatAQizePage.dart';

class CourseContentController {
//region  Keys
  static const List<HDMKey<CourseContentController>> _keyList = [key1];
  late HDMMain<CourseContentController> data;

  void _start() => data = HDMMain<CourseContentController>(this, (HDMBox<CourseContentController> box) => _WidgetCourseContent(this, box), _keyList);
  static const HDMKey<CourseContentController> key1 = HDMKey<CourseContentController>();

//endregion
  ClassRoom classroom;
  CourseContentController(this.classroom) {
    _start();
  }

  void addNewAnnoncement(BuildContext context) {
    final _key = GlobalKey<FormState>();
    String? text, title;
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
                            return 'Please enter the title';
                          }
                          return null;
                        },
                        onSaved: (value) async {
                          title = value.toString();
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the text';
                          }
                          return null;
                        },
                        onSaved: (value) async {
                          text = value.toString();
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              classroom.addAnAnnouncment(text: text!, title: title!);
                              Navigator.pop(context);
                            }
                          },
                          // key: _key,
                          child: Text("submit"))
                    ],
                  ))
            ],
            title: Text("create new announcemnt "),
          );
        });
  }
}

class _WidgetCourseContent extends HDMStatelessWidget<CourseContentController> {
  _WidgetCourseContent(CourseContentController app, HDMBox<CourseContentController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text("All orgnizationn"),
      ),
      body: HDMStreamBuilder<CourseMaterialBlock>(
        stream: app.classroom.courseMaterialBlock.get(),
        func: (block) => Card(
          child: ListTile(
            subtitle: Appcntroler.timeAgo(block),
            //    onTap: () => orgAccount.widget(orgAccount: orgAccount, org: app.org, context: context),

            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.supervised_user_circle),

            title: Text(block.title),
            //subtitle: Text(r!.),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(icon: Icons.add, children: [
        SpeedDialChild(
          child: Icon(Icons.announcement_outlined),
          label: 'An Announcment ',
          onTap: () => app.addNewAnnoncement(context),
        ),
        SpeedDialChild(
          child: Icon(Icons.text_snippet),
          label: 'An Qize',
          onTap: () {
            hDMNavigatorPush(context, CreatAQizeController(classRoom: app.classroom).data.play);
          },
        ),
      ]),
    );
  }
}
