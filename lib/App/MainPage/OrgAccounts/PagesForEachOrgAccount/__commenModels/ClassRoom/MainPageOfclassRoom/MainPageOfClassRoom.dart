import 'package:flutter/material.dart';
import 'package:x_bloc2/x_bloc2.dart';

class MainPageOfClassRoomController {
//region  Keys
  static const List<HDMKey<MainPageOfClassRoomController>> _keyList = [key1];
  late HDMMain<MainPageOfClassRoomController> data;
  void _start() => data = HDMMain<MainPageOfClassRoomController>(this, (HDMBox<MainPageOfClassRoomController> box) => _WidgetMainPageOfClassRoom(this, box), _keyList);
  static const HDMKey<MainPageOfClassRoomController> key1 = HDMKey<MainPageOfClassRoomController>();

//endregion
  MainPageOfClassRoomController() {
    _start();
  }
}

class _WidgetMainPageOfClassRoom extends HDMStatelessWidget<MainPageOfClassRoomController> {
  _WidgetMainPageOfClassRoom(MainPageOfClassRoomController app, HDMBox<MainPageOfClassRoomController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("s"),
    );
  }
}
