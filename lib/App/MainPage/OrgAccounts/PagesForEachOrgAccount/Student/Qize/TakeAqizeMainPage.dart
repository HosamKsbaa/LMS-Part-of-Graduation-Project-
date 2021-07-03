import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';
import 'package:x_bloc2/x_bloc2.dart';

class TakeAqizeMainPage {
//region  Keys
  static const List<HDMKey<TakeAqizeMainPage>> _keyList = [key1];
  late HDMMain<TakeAqizeMainPage> data;
  void _start() => data = HDMMain<TakeAqizeMainPage>(this, (HDMBox<TakeAqizeMainPage> box) => _WidgetNewQizePage(this, box), _keyList);
  static const HDMKey<TakeAqizeMainPage> key1 = HDMKey<TakeAqizeMainPage>();

//endregion
  TakeAqizeMainPage() {
    _start();
  }
  String qizeName = "ahmed";
  DateTime Date = DateTime.now().add(Duration(hours: 2));

  Duration hdmgetTime(DateTime theother) {
    return theother.difference(DateTime.now());
  }
}

class _WidgetNewQizePage extends HDMStatelessWidget<TakeAqizeMainPage> {
  _WidgetNewQizePage(TakeAqizeMainPage app, HDMBox<TakeAqizeMainPage> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.arrow_forward,
          ),
        ),
        appBar: AppBar(
          title: Text(" Qize "),
        ),
        drawer: HDmDrawerController().data.play(),
        body: Center(
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
                      child: Text("You are going to attempt :", style: TextStyle(fontSize: 20)),
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
                          Text("Operating System Exam", style: TextStyle(fontSize: 20))
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
                          Text("20 Questions", style: TextStyle(fontSize: 20))
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
                          Text("Duration : 30 min", style: TextStyle(fontSize: 20))
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
                        Text("20 Mark", style: TextStyle(fontSize: 20))
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
                            duration: app.hdmgetTime(app.Date),
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
                    )
                  ],
                ))));
  }
}
