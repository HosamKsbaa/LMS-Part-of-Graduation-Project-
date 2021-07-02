import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

import 'App/Login/LogIn.dart';
import 'App/MainPage/AccountsPage.dart';
import 'main.dart';

class MainControlerController {
//region  Keys
  static const List<HDMKey<MainControlerController>> _keyList = [key1];
  late HDMMain<MainControlerController> data;
  void _start() => data = HDMMain<MainControlerController>(this, (HDMBox<MainControlerController> box) => _WidgetMainControler(this, box), _keyList);
  static const HDMKey<MainControlerController> key1 = HDMKey<MainControlerController>();

//endregion
  MainControlerController() {
    _start();
    //TheApp.appcntroler.refrechTheapp = data.updateTheWholeApp;
  }
}

class _WidgetMainControler extends HDMStatelessWidget<MainControlerController> {
  _WidgetMainControler(MainControlerController app, HDMBox<MainControlerController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // final data = snapshot.data as String;
          throw {snapshot.error};
        }
        if (snapshot.connectionState == ConnectionState.active) {
          print("1");

          User? user = snapshot.data;
          if (user == null) {
            return LogInController().data.play();
          } else {
            //print("User init ");
            TheApp.appcntroler.user = user;

            return FutureBuilder<bool>(
                future: TheApp.appcntroler.afterSuccesLogInChecks(context: context),
                builder: (ctx, snapshot) {
                  print("3");
                  if (snapshot.hasError) {
                    // final data = snapshot.data as String;
                    throw {snapshot.error};
                  }
                  if (snapshot.hasData) {
                    // final data = snapshot.data as String;
                    return AccountsPageController().data.play();
                  }
                  // if (snapshot.connectionState == ConnectionState.done) {
                  //   if (snapshot.hasError) {
                  //     throw {snapshot.error};
                  //   } else
                  // }

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });
          }
        } else {
          print("2");
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
