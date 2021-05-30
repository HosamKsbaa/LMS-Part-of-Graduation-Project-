import 'package:flutter/material.dart';
import 'package:x_bloc/x_bloc.dart';
import 'package:x_misters/Apps/innerApps/students/Students.dart';

class App.Login {
  HDM<Login> data;

  App.Login() {
    data = HDM<Login>(this, _LoginWidget);
  }
}

Builder _LoginWidget(StateMain<Login> s) {
  return Builder(builder: (context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("TempPage"),
            RaisedButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Container())),
              color: Colors.blue,
              child: Text("المدرسين "),
            ),
            RaisedButton(
              onPressed: () {
                Students _students = Students();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => _students.data.play()));
              },
              color: Colors.green,
              child: Text("الطلاب "),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Container())),
              color: Colors.blue,
              child: Text("اولياء الامور  "),
            ),
          ],
        ),
      ),
    );
  });
}
