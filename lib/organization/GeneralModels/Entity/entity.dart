import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:lms/organization/Organization.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../Appcntroler.dart';

typedef _AsyncCallback = Future<void> Function();

abstract class Entity {
  Entity(this.entityId, String collection, this._parent) {
    if (this is Organization) {
      print(this.runtimeType);

      path = '/Organization';
    } else if (this is Appcntroler) {
      print(this.runtimeType);

      path = "/";
    } else if (_parent == null) {
      throw {"Has No paretn ${this.runtimeType}"};
    } else {
      path = _parent.path + "/" + _parent.entityId + "/" + collection;
    }
    print("Path of $Entity is $path <<<<<<<<<<<");

    //print(path);
  }
  bool _waitForDone = false;
  final Entity _parent;
  String path;
  final String entityId;

  DocumentReference _entityDocRef;

  //region watingFor
  List<_AsyncCallback> _waitForList = [];
  Future<void> waitFor() async {
    if (_parent != null) {
      //firestobj

      try {
        _entityDocRef = FirebaseFirestore.instance.doc(path + '/' + entityId);
      } catch (e) {
        toast("erro ${path + entityId} path dosn't work $e ");

        throw {"erro ${path + entityId} path dosn't work $e "};
      }
    }

    _waitForList.forEach((e) async => await e());
    await subWaitFor();
    _waitForDone = true;
  }

  //endregion
  //region   reFresj
  List<_AsyncCallback> _reFreshForList = [];

  Future<void> reFresh() {
    try {
      _reFreshForList.forEach((e) async => await e());
    } catch (e) {
      //todo delete all data if opration fail
      toast("there is an error on collection $Entity $e");
    }
  }

  //endregion
  // void storeThisObjForTheFirstTime() {
  //   _entityDocRef.set(this.toJson());
  //
  //
  // }

  ///Map<UserID,List<AccesLevel>>
  //todo final Map<String, List<AccessLevel>> userUserAccess;

  //todo final List<Log> logList;
  void subWaitFor();

  void firstTimeInit();

  Map<String, dynamic> toJson();
}

enum AccessLevel {
  Read, // R
  right, //w
  delete, //D
  suggestRight, //sr
  suggestDelete,
}

class HDMCollection<CollectionItem extends Entity> {
  final Entity _parent;
  final String collectionName;
  String _collectionPath;

  CollectionReference _collectionDocRef;
  Box objBox;

  HDMCollection(this._parent, this.collectionName) {
    this._parent._waitForList.add(_waitFor);
    this._parent._reFreshForList.add(refresh);
    if (this is HDMCollection<Organization>) {
      print(this.runtimeType);

      _collectionPath = '/Organization';
    } else {
      print(this.runtimeType);

      _collectionPath = _parent.path + '/' + _parent.entityId + '/' + collectionName;
    }
    print("Path of $CollectionItem is $_collectionPath");
  }

  Future<void> _waitFor() async {
    objBox = await Hive.openBox(_collectionPath.replaceAll('/', "%%"));
  }

  Future<void> add(CollectionItem obj) async {
    //if (_parent._waitForDone == false) throw {"not initilized ${this.runtimeType}"};
    // bool succes = false;
    _collectionDocRef = FirebaseFirestore.instance.collection(_collectionPath);

    await _collectionDocRef.doc(obj.entityId).set(obj.toJson());
    var z = await Hive.openBox(_collectionPath.replaceAll('/', "%%"));
    await z.put(
      obj.entityId,
      jsonEncode(obj.toJson()),
    );
    // try {
    //   await _collectionDocRef.doc(obj.entityId).set(obj.toJson());
    //   await objBox.put(
    //     obj.entityId,
    //     jsonEncode(obj.toJson()),
    //   );
    //   succes = true;
    // } catch (e) {
    //   _throwAnError(e);
    // }

    //   return succes;
  }

  Future<void> refresh() {
    //todo check the last log and get all things from it to now
  }

  Stream<List<CollectionItem>> get(Box<CollectionItem> box) {
    StreamController<List<CollectionItem>> controller = StreamController<List<CollectionItem>>();

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
