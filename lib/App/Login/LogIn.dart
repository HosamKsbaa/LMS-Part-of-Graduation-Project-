import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../main.dart';
import 'Widgets/res/custom_colors.dart';
import 'Widgets/widgets/google_sign_in_button.dart';

class LogInController {
//region  Keys
  static const List<HDMKey<LogInController>> _keyList = [key1];
  late HDMMain<LogInController> data;

  void _start() => data = HDMMain<LogInController>(this, (HDMBox box) => _WidgetLogIn(this, box), _keyList);
  static const HDMKey<LogInController> key1 = HDMKey<LogInController>();

//endregion
  LogInController() {
    _start();
  }
}

class _WidgetLogIn extends HDMStatelessWidget<LogInController> {
  _WidgetLogIn(LogInController app, HDMBox box) : super(app, box as HDMBox<LogInController>);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Indigo Container
            height: 670,
            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(500, 100), bottomRight: Radius.elliptical(500, 100)), color: Colors.indigo[900]),
          ),
          Container(
              // Light Blue container
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(500, 100), bottomRight: Radius.elliptical(500, 100)),
                color: Colors.lightBlue[300],
              )),
          Column(children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 40), child: Image(height: 250, width: 300, image: AssetImage("assets/logo.png"))),
            Padding(
              padding: EdgeInsets.only(bottom: 30, left: 20),
              child: Text("E-Learning Portal", style: TextStyle(fontSize: 30)),
            ),
            FutureBuilder(
                future: TheApp.appcntroler.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  );
                }),
            Padding(
                padding: EdgeInsets.only(top: 150, left: 50),
                child: Row(
                  children: [
                    Text(
                      "Follow Us",
                      style: TextStyle(fontSize: 25),
                    ),
                    FlatButton(onPressed: () => {}, child: Image(width: 40, height: 40, image: AssetImage("assets/fb.png"))),
                    FlatButton(onPressed: () => {}, child: Image(width: 40, height: 40, image: AssetImage("assets/insta.png")))
                  ],
                ))
          ])
        ],
      ),
    );
  }

}
