import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

class CreatAQizeController {
//region  Keys
  static const List<HDMKey<CreatAQizeController>> _keyList = [key1];
  late HDMMain<CreatAQizeController> data;
  void _start() => data = HDMMain<CreatAQizeController>(this, (HDMBox<CreatAQizeController> box) => _WidgetCreatAQize(this, box), _keyList);
  static const HDMKey<CreatAQizeController> key1 = HDMKey<CreatAQizeController>();

//endregion
  CreatAQizeController() {
    _start();
  }
}

class _WidgetCreatAQize extends HDMStatelessWidget<CreatAQizeController> {
  _WidgetCreatAQize(CreatAQizeController app, HDMBox<CreatAQizeController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}
