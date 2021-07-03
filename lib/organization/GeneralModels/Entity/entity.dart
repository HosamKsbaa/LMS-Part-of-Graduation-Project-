import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/User/UserPriviteDate.dart';
import 'package:lms/User/UserPublicData.dart';
import 'package:lms/main.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/OrgnizationPointer.dart';
import 'package:lms/organization/orgAccount/OrgAccountPointer.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path_provider/path_provider.dart';

import '../../Organization.dart';
import '../../orgnizationAccountControler.dart';
import 'Activity/AccesLevel/AccesLevel.dart';
import 'Activity/ActivitySignetre.dart';
import 'Activity/Log/Log.dart';
import 'RootEntity/RootEntity.dart';

part "pointer/Pointer.dart";

enum EntityTyps {
  Organization,
  // Appcntroler,
  ActivitySignetre,
  AccesLevel,
  Log,
  Hidden,
  Pointer,
  RootEntity,
  UserPriviteDate,
  UserPublicData,
}

abstract class Entity {
  @mustCallSuper
  Entity(this.entityId, {required this.entityTyps, required this.lastTimeEdited});

  final EntityTyps entityTyps;
  DateTime lastTimeEdited;
  @JsonKey(ignore: true)
  Entity? theParent;
  late String collectionPath;
  @required
  final String entityId;
  final List<HDMCollection> _childCollections = [];
  bool doneSet = false;
  late DocumentReference _entityDocRef;

  Future<void> setPath(Entity? parent, collection) async {
    if (!doneSet) {
      theParent = parent;

      if (this is RootEntity) {
        //print(this.runtimeType);
        collectionPath = "/";
      } else if (this.theParent is RootEntity) {
        //  print(this.runtimeType);

        collectionPath = "/" + collection;
      } else if (theParent == null) {
        throw {"Has No paretn ${this.runtimeType}"};
      } else {
        collectionPath = theParent!.collectionPath + "/" + theParent!.entityId + "/" + collection;
      }
      try {
        await Future.forEach<HDMCollection>(_childCollections, (e) async => await e._setIt());

        // _childCollections.forEach((e) => e._setIt());
      } catch (e) {
        // print();
        //todo delete all data if opration fail
        toast("there is an error on collection $Entity $e");
      }
    }
    // print("Path of $Entity is $collectionPath <<<<<<<<<<<");
    //print(path);
  }

  Future<void> _waitFor() async {
    if (theParent != null) {
      //firestobj
      try {
        _entityDocRef = FirebaseFirestore.instance.doc(collectionPath + '/' + entityId);
      } catch (e) {
        toast("erro ${collectionPath + entityId} path dosn't work $e ");

        throw {"erro ${collectionPath + entityId} path dosn't work $e "};
      }
    }

    try {
      await Future.forEach<HDMCollection>(_childCollections, (e) async => await e._waitFor());
    } catch (e) {
      //todo delete all data if opration fail
      toast("there is an error on collection $Entity $e");
    }
  }

  Future<void> reFresh() async {
    try {
      await Future.forEach<HDMCollection>(_childCollections, (e) async => await e._refresh());
    } catch (e) {
      throw {"there is an error on collection $Entity $e"};
      //todo delete all data if opration fail
      toast("there is an error on collection $Entity $e");
    }
  }

  factory Entity.fromJson(Map<String, dynamic> json) {
    var x = EntityTyps.values.firstWhere((e) {
      // print("testhello" + e.toString().split(".").last + "==" + json["entityTyps"]);
      return e.toString().split(".").last == json["entityTyps"];
    });
    assert(x != null, "there is no orgAccountType parameter in  ");
    switch (x) {
      case EntityTyps.Organization:
        return Organization.fromJson(json);
        break;
      case EntityTyps.RootEntity:
        return RootEntity.fromJson(json);
        break;
      case EntityTyps.ActivitySignetre:
        return ActivitySignetre.fromJson(json);
        break;
      case EntityTyps.AccesLevel:
        return AccesLevel.fromJson(json);
        break;
      case EntityTyps.Log:
        return Log.fromJson(json);
        break;
      case EntityTyps.Hidden:
        return Hidden.fromJson(json);
        break;
      case EntityTyps.UserPriviteDate:
        return UserPriviteDate.fromJson(json);
        break;
      case EntityTyps.Pointer:
        return HDMPointer.fromJson(json);
        break;
      case EntityTyps.UserPublicData:
        return UserPublicData.fromJson(json);
        break;
      default:
        return throw {"Error undefined ${json["entityTyps"]}}"};
    }
  }

  Map<String, dynamic> toJson();
}

class HDMCollection<CollectionItem extends Entity> {
  final Entity _parent;
  final String collectionName;
  late String _collectionPath;
  List<CollectionItem>? list;
  // bool isSet=false;

  late CollectionReference<Map<String, dynamic>> _collectionDocRef;
  Box<String>? _objBox;

  HDMCollection(this._parent, this.collectionName) {
    _parent._childCollections.add(this);
  }

  void cleanBox() {
    _objBox!.deleteFromDisk();
  }

  CollectionItem _tra(String e) {
    return Entity.fromJson(jsonDecode(e)) as CollectionItem;
  }

  void UpdateValue() {}

  Future<CollectionItem?> getValOnline(String entityId) async {
    //print("????????????????? " + _collectionPath + '/' + entityId);
    var x = FirebaseFirestore.instance.doc(_collectionPath + '/' + entityId);
    return await x.get().then<CollectionItem?>((x1D) async {
      var x2 = x1D.data();
      if (x2 == null) {
        print("didn't find ${_collectionPath + '/' + entityId}");
        return null;
      }

      //print("didn't find ${_collectionPath + '/' + entityId}");

      CollectionItem x3 = Entity.fromJson(x2) as CollectionItem;
      await x3.setPath(this._parent, collectionName);
      //  print(x3..toJson().toString());

      return x3;
    }).timeout(Duration(seconds: 1), onTimeout: () {
      toast("You are Oflline , plz restore connection");
    });
  }

  Future<void> updateValue(
    CollectionItem obj,
  ) async {
    await _trigerSetChild(obj);

    _collectionDocRef = FirebaseFirestore.instance.collection(_collectionPath);
    obj.lastTimeEdited = DateTime.now();

    await _collectionDocRef.doc(obj.entityId).update(obj.toJson()).then((value) async {
      await _waitFor();

      await _objBox!.put(
        obj.entityId,
        jsonEncode(obj.toJson()),
      );

      toast("Sucessfuly added To Local and global Database");
    }).timeout(Duration(seconds: 1), onTimeout: () {
      toast("You are Oflline , plz restore connection");
    });
  }

  Future<CollectionItem?> getValLocaly(String entityId) async {
    await _refresh();
    await _waitFor();

    //print(TheApp.appcntroler.userUid);
    // print(TheApp.appcntroler.user!.uid.toString());
    // print(_objBox.keys);
    // print(_objBox.values);
    var e = _objBox!.get(entityId);
    if (e == null) {
      List<String> values = _objBox!.keys.map((e) => e.toString() + "\n").toList();
      print("""didn't find ${this.runtimeType} 
         $entityId
         =================
         $values 
      """);

      // print("");
      // _objBox!.values.forEach((element) {
      //   print(element);
      // });
      return null;
    } else {
      var z = Entity.fromJson(jsonDecode(e)) as CollectionItem?;
      await z!.setPath(this._parent, collectionName);
      return z;
    }
  }

  Future<void> _trigerSetChild(CollectionItem obj) async {
    await obj.setPath(_parent, collectionName);
//    isSet=true;
  }

  Future<void> _setIt() async {
    // print("$this is set ");
    if (this._parent is Appcntroler) {
      //  print(this.runtimeType);
      //  print("set it for Appcntroler");
      _collectionPath = '/' + collectionName;
    } else {
      // print(this.runtimeType);

      _collectionPath = _parent.collectionPath + '/' + _parent.entityId + '/' + collectionName;
    }
    await _waitFor();
    //_refresh();
    // list = await _objBox!.values.map<CollectionItem>(_tra).toList();

    // print("Path of $CollectionItem is $_collectionPath");
  }

  Future<void> _waitFor() async {
    // print("check if box is open");

    if (_objBox == null) {
      //   print("no");
      Directory appDocDir = await getApplicationDocumentsDirectory();
      // String appDocPath = appDocDir.path;
      print(appDocDir.path + _collectionPath);
      _objBox = await Hive.openBox(_collectionPath.split("/").last, path: appDocDir.path + _collectionPath);

      return;
    }
    // print("yes");
    return;
  }

  Future<void> _refresh() async {
    await _waitFor();

    list = _objBox!.values.map<CollectionItem>(_tra).toList();
    DateTime lastTimeUpdated = DateTime(1970);
    list!.forEach((element) {
      if (element.lastTimeEdited.isAfter(lastTimeUpdated)) {
        lastTimeUpdated = element.lastTimeEdited;
      }
    });
    _collectionDocRef = FirebaseFirestore.instance.collection(_collectionPath);

    await _collectionDocRef.where('lastTimeEdited', isGreaterThan: lastTimeUpdated.toString()).get().then((value) async {
      await _waitFor();
      int i = 0;
      await Future.forEach<QueryDocumentSnapshot<Map<String, dynamic>>>(value.docs, (e) async {
        CollectionItem obj = Entity.fromJson(e.data()) as CollectionItem;
        print("9999999999999999999999999999999999999999999999999999" + obj.entityId);
        await _objBox!.put(
          obj.entityId,
          jsonEncode(obj.toJson()),
        );

        i++;
      });

      print("9999999999999999999999999999999999999999999999999999 >>>>>>>>>>>>>>>>>> $lastTimeUpdated");
      print("9999999999999999999999999999999999999999999999999999 >>>>>>>>>>>>>>>>>> $i,${this.runtimeType} ");
      toast("Sucessfuly Loaded $i");
    }).timeout(Duration(seconds: 1), onTimeout: () {
      toast("You are Oflline , plz restore connection");
    });

    // var x = FirebaseFirestore.instance.doc(_collectionPath + '/' + entityId);
    // return await x.get().then<CollectionItem?>((x1D) async {
    //   var x2 = x1D.data();
    //   if (x2 == null) {
    //     print("didn't find ${_collectionPath + '/' + entityId}");
    //     return null;
    //   }
    //
    //   //print("didn't find ${_collectionPath + '/' + entityId}");
    //
    //   CollectionItem x3 = Entity.fromJson(x2) as CollectionItem;
    //   await x3.setPath(this._parent, collectionName);
    //   //  print(x3..toJson().toString());
    //
    //   return x3;
    // }).timeout(Duration(seconds: 1), onTimeout: () {
    //   toast("You are Oflline , plz restore connection");
    // });
    //todo check the last log and get all things from it to now
  }

  Future<void> add(CollectionItem obj, {Function? ifRebeted}) async {
    //if (_parent._waitForDone == false) throw {"not initilized ${this.runtimeType}"};
    // bool succes = false;
    //print(">>>>>>>>>$this is set ");

    ///remove

    await _trigerSetChild(obj);

    _collectionDocRef = FirebaseFirestore.instance.collection(_collectionPath);
    obj.lastTimeEdited = DateTime.now();

    await _collectionDocRef.doc(obj.entityId).set(obj.toJson()).then((value) async {
      await _waitFor();

      bool checkMethou() {
        var x = _objBox!.values.map<CollectionItem>(_tra).toList();

        var x2 = x.any((element) {
          return element.entityId == obj.entityId;
        });
        return x2;
      }

      if (checkMethou()) {
        ifRebeted == null ? throw {"2 elements with the same id ix it ${this.runtimeType} "} : ifRebeted();
        return null;
      }

      await _objBox!.put(
        obj.entityId,
        jsonEncode(obj.toJson()),
      );

      toast("Sucessfuly added To Local and global Database");
    }).timeout(Duration(seconds: 1), onTimeout: () {
      toast("You are Oflline , plz restore connection");
    });
  }

  Stream<List<CollectionItem>> get() {
    _collectionDocRef = FirebaseFirestore.instance.collection(_collectionPath);
    _collectionDocRef.snapshots().listen((event) {
      _refresh();
    });
    // print(this.runtimeType);
    _refresh();

    assert(_collectionPath != null, "${this.runtimeType}");
    StreamController<List<CollectionItem>> controller = StreamController<List<CollectionItem>>();

    Future<List<CollectionItem>?> geter() async {
      await _waitFor();
      list = _objBox!.values.map<CollectionItem>(_tra).toList();
      print("================" + list.toString());
      await Future.forEach<CollectionItem>(list!, _trigerSetChild);
      controller.add(list!);
      return list;
    }

    controller.onListen = () async {
      geter().then((value) => controller.add(value!));
    };

    _waitFor().then((value) => _objBox!.watch().listen((event) async {
          geter().then((value) => controller.add(value!));
        }));

    controller.onCancel = () {
      controller.close();
    };

    return controller.stream.asBroadcastStream();
  }
}
