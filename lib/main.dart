import 'package:flutter/material.dart';

import 'App/Login/LogIn.dart';
//flutter packages pub run build_runner build --delete-conflicting-outputs

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git Hub Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInController().data.play(),
    );
  }
}
