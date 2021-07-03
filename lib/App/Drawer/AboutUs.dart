import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

class AboutUsController {
//region  Keys
  static const List<HDMKey<AboutUsController>> _keyList = [key1];
  late HDMMain<AboutUsController> data;

  void _start() => data = HDMMain<AboutUsController>(this,
      (HDMBox<AboutUsController> box) => _WidgetAboutUs(this, box), _keyList);
  static const HDMKey<AboutUsController> key1 = HDMKey<AboutUsController>();

//endregion
  AboutUsController() {
    _start();
  }
}

class _WidgetAboutUs extends HDMStatelessWidget<AboutUsController> {
  _WidgetAboutUs(AboutUsController app, HDMBox<AboutUsController> box)
      : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Center(
        child: RichText(
            text: TextSpan(style: TextStyle(color: Colors.black), children: [
          TextSpan(
              text:
                  "we are team of developer that trying to make E-learning system ",
            ),
          TextSpan(
              text: "easier and safer to use in any learning institution ",
          ) ,
          TextSpan(
              text: "regardless to your internet connection problem",
              style: TextStyle(
                  decoration: TextDecoration.underline)),
        ])),
      ),
    );
  }
}
