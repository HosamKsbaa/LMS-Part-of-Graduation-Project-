import 'dart:io';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import "package:x_bloc/x_bloc.dart";
import 'package:x_misters/Apps/rusableSystems/App.Login/FireBaseLogin.dart';

class MyAppHandler {
  HDM<MyAppHandler> data;
  // ignore: non_constant_identifier_names
  static TheApps Apps = TheApps();

  MyAppHandler() {
    data = HDM<MyAppHandler>(this, _myAppHandlerWidget, wait: initMyApp, initial: StatsInitial());
  }

  List<DeviceOrientation> preferredOrientations = [
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ];

  Future<void> initMyApp() async {
    Future<void> startHive() async {
      // Directory document = await getApplicationDocumentsDirectory();
      // print(document.path);
      // var status = await Permission.storage.status;
      // if (!status.isGranted) {
      //   await Permission.storage.request();
      // }
      // // Hive.init("/sdcard/hell");
      // Hive.init(document.path);

      await Hive.init(Directory.current.path);
      print("done");

      //  Hive.registerAdapter(TagUnitAdapter());
    }

    await Firebase.initializeApp();
    await startHive();
  }

  ThemeData themeData = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

class TheApps {
  // Tic tic = Tic();
}

//add more compment to make multable build ;
class StatsInitial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

enum MyAppEnum { BuildTheWholeScreen, Numbers }

Builder _myAppHandlerWidget(StateMain<MyAppHandler> s) {
  return Builder(builder: (context) {
    s.h != null ? SystemChrome.setPreferredOrientations(s.h.preferredOrientations) : null;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: DoubleBackToCloseApp(
          child: FireBaseLogin().data.play(),
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
        ),
      ),
    );
  });
}
