import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/MainPage/AccountsPage.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Announecmt2/Announecmt.dart';
import 'package:x_bloc2/x_bloc2.dart';


class CourseContentController {
//region  Keys
  static const List<HDMKey<CourseContentController>> _keyList = [key1];
  late HDMMain<CourseContentController> data;

  void _start() =>
      data = HDMMain<CourseContentController>(
          this, (HDMBox<CourseContentController> box) =>
          _WidgetCourseContent(this, box), _keyList);
  static const HDMKey<CourseContentController> key1 = HDMKey<
      CourseContentController>();

//endregion
  ClassRoom classroom;
  CourseContentController(this.classroom) {
    _start();
  }


  void addNewAnnoncement(BuildContext context) {
    final _key = GlobalKey<FormState>();
    String? text ,title;
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
                       title =value.toString();
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
                          text =value.toString();
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
            title: Text("create new ClassRoom"),
          );
        });
  }
}


class _WidgetCourseContent extends HDMStatelessWidget<CourseContentController> {
  _WidgetCourseContent(CourseContentController app,
      HDMBox<CourseContentController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HDmDrawerController().data.play(),
    appBar: AppBar(
    title: Text("All orgnizationn"),
    ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
      app.addNewAnnoncement(context);

        },
      child: Icon(Icons.add),
      ),

    );
  }
}