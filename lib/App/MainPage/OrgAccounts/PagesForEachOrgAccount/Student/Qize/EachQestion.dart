import 'package:flutter/material.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/Student/Qize/solveTHeqestions.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/QestionsTypes/MCQ.dart';
import 'package:x_bloc2/x_bloc2.dart';

class EachQestionController {
//region  Keys
  static const List<HDMKey<EachQestionController>> _keyList = [key1];
  late HDMMain<EachQestionController> data;
  void _start() => data = HDMMain<EachQestionController>(this, (HDMBox<EachQestionController> box) => _WidgetEachQestion(this, box), _keyList);
  static const HDMKey<EachQestionController> key1 = HDMKey<EachQestionController>();

//endregion
  final MCQ e;
  final solveTHeqestionsController app;
  late List<String> listOfQestions;

  EachQestionController(this.e, this.app) {
    _start();

    listOfQestions = e.ansers.values.toList();
    listOfQestions.shuffle();
  }
  void anserAqestion() {
    app.nextPage();
  }
}

class _WidgetEachQestion extends HDMStatelessWidget<EachQestionController> {
  _WidgetEachQestion(EachQestionController app, HDMBox<EachQestionController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20, right: 180),
          child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "Questions",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "/",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "20",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              width: 170,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0xffffb0b0),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 120),
          child: Center(
              child: Container(
            child: Column(
              // ignore: unnecessary_cast
              children: (app.listOfQestions
                      .map((e) => Column(
                            children: [
                              // ignore: unnecessary_cast, unnecessary_cast, unnecessary_cast
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15, left: 10),
                                child: Row(children: [
                                  //Radio(),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2),
                                    child: Text(
                                      "Network Layer",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ]),
                              ),
                            ],
                          ))
                      .toList() as List<Widget>) +
                  <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 55, left: 20),
                        child: Row(children: [
                          Padding(padding: EdgeInsets.only(left: 20), child: IconButton(icon: const Icon(Icons.arrow_forward_ios), tooltip: 'Next Question', iconSize: 40, color: const Color(0xff33cef5), onPressed: () {})),
                          Padding(
                              padding: EdgeInsets.only(left: 40),
                              child: FlatButton(
                                  onPressed: () => {},
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 19),
                                            child: Text(
                                              "Submit",
                                              style: TextStyle(fontSize: 18),
                                            ))
                                      ],
                                    ),
                                    width: 100,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26.0),
                                      color: const Color(0xffffb0b0),
                                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                                    ),
                                  )))
                        ]))
                  ],
            ),
            width: 350,
            height: 450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(19.0),
              color: const Color(0xffffffff),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          )),
        ),
      ],
    );
  }
}
