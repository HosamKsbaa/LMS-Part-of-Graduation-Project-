import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/Student/Qize/solveTHeqestions.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/QestionsFile.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/Quiz2.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../../../AccountsPage.dart';

class TakeAqizeMainPage {
//region  Keys
  static const List<HDMKey<TakeAqizeMainPage>> _keyList = [key1];
  late HDMMain<TakeAqizeMainPage> data;
  void _start() => data = HDMMain<TakeAqizeMainPage>(this, (HDMBox<TakeAqizeMainPage> box) => _WidgetNewQizePage(this, box), _keyList);
  static const HDMKey<TakeAqizeMainPage> key1 = HDMKey<TakeAqizeMainPage>();

//endregion
  final Quiz quiz;
  TakeAqizeMainPage(this.quiz) {
    _start();
  }
  //String qizeName = "ahmed";
  //DateTime Date = DateTime.now().add(Duration(hours: 2));

  Duration hdmgetTime(DateTime theother) {
    return theother.difference(DateTime.now());
  }
}

class _WidgetNewQizePage extends HDMStatelessWidget<TakeAqizeMainPage> {
  _WidgetNewQizePage(TakeAqizeMainPage app, HDMBox<TakeAqizeMainPage> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Qize "),
        ),
        drawer: HDmDrawerController().data.play(),
        body: StreamBuilder<List<QestionsFile>>(
          stream: app.quiz.questioncol.get(),
          builder: (BuildContext context, AsyncSnapshot<List<QestionsFile>> snapshot) {
            int counter = 0;
            if (snapshot.hasError) {
              throw {snapshot.error};
            } else if (snapshot.hasData) {
              List<QestionsFile> data = snapshot.data!;
              var obj = data.first;
              // print("======================================== ${x.runtimeType}");
              // data.forEach((element) {
              //   print(element.toJson());
              // });
              // print("================================");
              if (data.length == 0) {
                return NoContent();
              } else {
                return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) => Column(
                    children: [
                      Text("There is ${data.length} elements last update ${DateTime.now()}"),
                      Center(
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.info, color: Colors.blueAccent),
                                        ),
                                        Text("Please have a stable internet ", style: TextStyle(fontSize: 20)),
                                      ],
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 20), child: Text("connection to approach the exam", style: TextStyle(fontSize: 20))),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Text("You are going to attempt :${obj.posiibleAttimpts}", style: TextStyle(fontSize: 20)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.assignment_turned_in, color: Colors.blueAccent),
                                        ),
                                        Text("v 10  Exam", style: TextStyle(fontSize: 20))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.warning, color: Colors.blueAccent),
                                        ),
                                        Text("1 Attempt", style: TextStyle(fontSize: 20))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.question_answer_outlined, color: Colors.blueAccent),
                                        ),
                                        Text("${obj.qestionMap.length} Questions", style: TextStyle(fontSize: 20))
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(Icons.timer_outlined, color: Colors.blueAccent),
                                        ),
                                        Text("Duration : ${obj.allwedDuration}", style: TextStyle(fontSize: 20))
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: Icon(Icons.star, color: Colors.blueAccent),
                                      ),
                                      Text("${obj.marks} Mark", style: TextStyle(fontSize: 20))
                                    ],
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: SlideCountdownClock(
                                          tightLabel: true,
                                          shouldShowDays: true,
                                          duration: obj.startDate.difference(DateTime.now()),
                                          slideDirection: SlideDirection.Up,
                                          separator: "  ",
                                          textStyle: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          separatorTextStyle: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                          padding: EdgeInsets.all(0),
                                          decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.rectangle),
                                          onDone: () {
                                            app.data.updateTheWholeApp();
                                            //print("done");
                                            //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Clock 1 finished')));
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  FlatButton(onPressed: () => hDMNavigatorPush(context, solveTHeqestionsController(qf: obj).data.play), child: Text("Go"))
                                ],
                              )))
                    ],
                  ),
                );
              }
            }

            return CirclerWaiting();
          },
        ));
  }
}
