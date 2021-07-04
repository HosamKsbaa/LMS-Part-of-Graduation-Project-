import 'package:flutter/material.dart';



class Instruct extends StatelessWidget {
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
                  Icons.warning_amber_rounded,
                ),
              ),
              Text('Instructions')
            ]),
          ),
          body: Center(
        child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      Text("Please have a stable internet ",
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text("connection to approach the exam",
                        style: TextStyle(fontSize: 20))),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("You are going to attempt :",
                      style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.assignment_turned_in,
                            color: Colors.blueAccent),
                      ),
                      Text("Operating System Exam",
                          style: TextStyle(fontSize: 20))
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
                        child: Icon(Icons.question_answer_outlined,
                            color: Colors.blueAccent),
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
                        child: Icon(Icons.timer_outlined,
                            color: Colors.blueAccent),
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


               Padding( padding: EdgeInsets.only(top: 50),
                 child: Row(
                   children: [
                    Padding( padding: EdgeInsets.only(left : 60),
                      child: FlatButton(
                        child: Container(
                          child:  Center(child: Text("Back")),
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26.0),
                            color: const Color(0xffffb0b0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                        onPressed: () => {},
                      ),
                    ),
                            FlatButton(
                       child: Container(
                         child:  Center(child: Text("Enter")),
                         width: 100,
                         height: 50,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(26.0),
                           color: Colors.blueAccent,
                           border: Border.all(
                               width: 1.0, color: const Color(0xff707070)),
                         ),
                       ),
                       onPressed: () => {},
                     )
                   ],
                 )
               )
              ],
            )
            )
            )
        ));
  }
}