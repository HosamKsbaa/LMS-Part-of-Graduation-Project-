import 'package:flutter/material.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/Qestion.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/QestionsFile.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/QestionsTypes/MCQ.dart';
import 'package:x_bloc2/x_bloc2.dart';

import 'EachQestion.dart';

class solveTHeqestionsController {
//region  Keys
  static const List<HDMKey<solveTHeqestionsController>> _keyList = [key1];
  late HDMMain<solveTHeqestionsController> data;
  void _start() => data = HDMMain<solveTHeqestionsController>(this, (HDMBox<solveTHeqestionsController> box) => _WidgetsolveTHeqestions(this, box), _keyList);
  static const HDMKey<solveTHeqestionsController> key1 = HDMKey<solveTHeqestionsController>();

//endregion
  final QestionsFile qf;
  late List<Qestion> listOfQestions;
  PageController pageController = PageController();

  solveTHeqestionsController({required this.qf}) {
    _start();
    listOfQestions = qf.qestionMap.values.toList();
    listOfQestions.shuffle();
  }
  int vv = 1;
  void nextPage() {
    vv++;
    pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}

class _WidgetsolveTHeqestions extends HDMStatelessWidget<solveTHeqestionsController> {
  _WidgetsolveTHeqestions(solveTHeqestionsController app, HDMBox<solveTHeqestionsController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Row(children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.laptop_windows,
                    size: 18,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: Text(
                      'Operating Systems',
                      style: TextStyle(fontSize: 18),
                    )),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Icon(
                    Icons.timer,
                    size: 20,
                  ),
                ),
                Text(
                  "30:00",
                  style: TextStyle(fontSize: 18),
                )
              ]),
              backgroundColor: const Color(0xff104987),
            ),
            body: PageView(
              controller: app.pageController,
              physics: new NeverScrollableScrollPhysics(),
              children: app.listOfQestions.map((e) => EachQestionController(e as MCQ, app, app.qf).data.play()).toList(),
            )));
  }
}
