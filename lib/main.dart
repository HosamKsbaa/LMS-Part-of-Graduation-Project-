import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:overlay_support/overlay_support.dart';

import 'App/Login/LogIn.dart';
import 'App/Login/Logic/authentication.dart';
import 'App/MainPage/AccountsPage.dart';
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
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                User? user = snapshot.data;
                if (user == null) {
                  return LogInController().data.play();
                }
                Authentication.user = user;
                return AccountsPageController().data.play();
              } else {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          )
          //home: ,
          ),
    );
  }
}

// if no local , see if there is online
//if no online sighUp
// if yes online donlode
// if yes local just go
