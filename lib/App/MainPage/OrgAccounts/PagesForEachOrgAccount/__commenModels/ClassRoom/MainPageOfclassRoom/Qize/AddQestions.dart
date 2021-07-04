import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

class AddQestionsController {
//region  Keys
  static const List<HDMKey<AddQestionsController>> _keyList = [key1];
  late HDMMain<AddQestionsController> data;
  void _start() => data = HDMMain<AddQestionsController>(this, (HDMBox<AddQestionsController> box) => _WidgetAddQestions(this, box), _keyList);
  static const HDMKey<AddQestionsController> key1 = HDMKey<AddQestionsController>();

//endregion
  AddQestionsController() {
    _start();
  }
}

class _WidgetAddQestions extends HDMStatelessWidget<AddQestionsController> {
  _WidgetAddQestions(AddQestionsController app, HDMBox<AddQestionsController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}
