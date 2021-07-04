import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:overlay_support/overlay_support.dart';

import 'MainControler.dart';
import 'organization/orgnizationAccountControler.dart';

//flutter packages pub run build_runner build --delete-conflicting-outputs

class TheApp {
  static Appcntroler appcntroler = Appcntroler();
}

Future<void> main() async {
  await Hive.initFlutter();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Future getCurrentUser() async {
  //   FirebaseUser _user = await FirebaseAuth.instance.currentUser!();
  //   print("User: ${_user.displayName ?? "None"}");
  //   return _user;
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Git Hub Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: CreatAQizeController().data.play(),
        home: FutureBuilder(
          future: TheApp.appcntroler.setPath1(),
          builder: (ctx, snapshot) {
            print("3");
            if (snapshot.hasError) {
              // final data = snapshot.data as String;
              throw {snapshot.error};
            }
            if (snapshot.hasData) {
              // final data = snapshot.data as String;
              return MainControlerController().data.play();
            }
            // if (snapshot.connectionState == ConnectionState.done) {
            //   if (snapshot.hasError) {
            //     throw {snapshot.error};
            //   } else
            // }

            return Center(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return CircularProgressIndicator();
                },
              ),
            );
          },
        ),
      ),
    );

    //home: ,
  }
}

// if no local , see if there is online
//if no online sighUp
// if yes online donlode
// if yes local just go
