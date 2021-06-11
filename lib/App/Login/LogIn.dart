

import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

import 'Logic/authentication.dart';
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
      backgroundColor: CustomColors.firebaseNavy,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        flex: 1,
                        child: FlutterLogo(
                          size: 150,
                        )),
                    SizedBox(height: 20),
                    Text(
                      'LMS',
                      style: TextStyle(
                        color: CustomColors.firebaseYellow,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'X-Team',
                      style: TextStyle(
                        color: CustomColors.firebaseOrange,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
