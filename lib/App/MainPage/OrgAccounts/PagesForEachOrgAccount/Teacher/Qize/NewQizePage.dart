import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

class NewQizePageController {
//region  Keys
  static const List<HDMKey<NewQizePageController>> _keyList = [key1];
  late HDMMain<NewQizePageController> data;
  void _start() => data = HDMMain<NewQizePageController>(this, (HDMBox<NewQizePageController> box) => _WidgetNewQizePage(this, box), _keyList);
  static const HDMKey<NewQizePageController> key1 = HDMKey<NewQizePageController>();

//endregion
  NewQizePageController() {
    _start();
  }
}

class _WidgetNewQizePage extends HDMStatelessWidget<NewQizePageController> {
  _WidgetNewQizePage(NewQizePageController app, HDMBox<NewQizePageController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}
