import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:overlay_support/overlay_support.dart';

import 'App/Login/LogIn.dart';

//flutter packages pub run build_runner build --delete-conflicting-outputs

Future<void> main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Git Hub Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LogInController().data.play(),
      ),
    );
  }
}
