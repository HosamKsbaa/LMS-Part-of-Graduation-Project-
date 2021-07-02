import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';


class InsideCoursePageController {
//region  Keys
  static const List<HDMKey<InsideCoursePageController>> _keyList = [key1];
  late HDMMain<InsideCoursePageController> data;

  void _start() =>
      data = HDMMain<InsideCoursePageController>(
          this, (HDMBox<InsideCoursePageController> box) =>
          _WidgetInsideCoursePage(this, box), _keyList);
  static const HDMKey<InsideCoursePageController> key1 = HDMKey<
      InsideCoursePageController>();

//endregion
  InsideCoursePageController() {
    _start();
  }
}


class _WidgetInsideCoursePage extends HDMStatelessWidget<InsideCoursePageController> {
  _WidgetInsideCoursePage(InsideCoursePageController app,
      HDMBox<InsideCoursePageController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}