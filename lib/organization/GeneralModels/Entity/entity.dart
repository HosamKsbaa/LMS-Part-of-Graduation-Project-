import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';

import 'Log.dart';

abstract class Entity {
  Entity({this.entityId, this.userUserAccess, this.logList});
  final String entityId;

  ///Map<UserID,List<AccesLevel>>
  final Map<String, List<AccessLevel>> userUserAccess;

  final List<Log> logList;

  void firstTimeInit();

  void start();
  void checkForeUpdatesOnline();

  Stream<List<theType>> streamProvider<theType>(Box<theType> box) {
    StreamController<List<theType>> controller = StreamController<List<theType>>();

    controller.add(box.values.map((e) => jsonDecode(e as String)).toList());

    box.watch().listen((event) {
      controller.add(box.values.map((e) => jsonDecode(e as String)).toList());
    });
    controller.onCancel = () {
      controller.close();
    };

    return controller.stream;
  }
}

enum AccessLevel {
  Read, // R
  right, //w
  delete, //D
  suggestRight, //sr
  suggestDelete,
}
