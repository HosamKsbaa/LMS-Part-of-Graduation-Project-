import 'package:flutter/material.dart';

void main() => runApp((CreateExam()));

class CreateExam extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Row(children: [
                Text("Network II", style: TextStyle(fontSize: 25)),
              ]),
            ),
            body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Center(
                    child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 5, right: 170),
                        child: Text("Question ", style: TextStyle(fontSize: 25, color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Container(
                          width: 320,
                          height: 70,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type your Question",
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueAccent),
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  width: 370,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29.0),
                    color: const Color(0xff104987),
                    border: Border.all(width: 1.0, color: const Color(0xff104987)),
                  ),
                )),
              ),
            ])));
  }
}
