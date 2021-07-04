import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/User/UserPriviteDate.dart';
import 'package:lms/User/UserPublicData.dart';
import 'package:lms/main.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoomPointer.dart';
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
  // Box<String>? _objBox;

  HDMCollection(this._parent, this.collectionName) {
    _parent._childCollections.add(this);
  }

  Future<void> cleanBox() async {
    Box<String>? _objBox = await _waitFor();
    _objBox.deleteFromDisk();
  }

  //region tra abd push
  CollectionItem _tra(String e) {
    var z = Entity.fromJson(jsonDecode(e)) as CollectionItem;
    z.lastTimeEdited = z.lastTimeEdited.toLocal();
    return z;
  }

  CollectionItem _traattatch(CollectionItem e) {
    e.lastTimeEdited = e.lastTimeEdited.toLocal();
    return e;
  }

  CollectionItem _traMap(Map<String, dynamic>? x2) {
    CollectionItem z = Entity.fromJson(x2!) as CollectionItem;
    return _traattatch(z);
  }

  Map<String, dynamic> push(CollectionItem e) {
    e.lastTimeEdited = DateTime.now();
    Map<String, dynamic> x = e.toJson();

    return x;
  }

  ///end region
  ///
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

      CollectionItem x3 = _traMap(x2);
      await x3.setPath(this._parent, collectionName);
      //  print(x3..toJson().toString());

      return x3;
    }).timeout(Duration(seconds: 4), onTimeout: () {
      toast("You are Oflline , plz restore connection");
    });
  }

  Future<void> updateValue(
    CollectionItem obj,
  ) async {
    await _trigerSetChild(obj);

    _collectionDocRef = FirebaseFirestore.instance.collection(_collectionPath);

    await _collectionDocRef.doc(obj.entityId).update(push(obj)).then((value) async {
      Box<String>? _objBox = await _waitFor();

      await _objBox.put(
        obj.entityId,
        jsonEncode(push(obj)),
      );

      toast("Sucessfuly added To Local and global Database");
    }).timeout(Duration(seconds: 4), onTimeout: () {
      toast("You are Oflline , plz restore connection");
    });
  }

  Future<CollectionItem?> getValLocaly(String entityId) async {
    await _refresh();
    Box<String>? _objBox = await _waitFor();

    //print(TheApp.appcntroler.userUid);
    // print(TheApp.appcntroler.user!.uid.toString());
    // print(_objBox.keys);
    // print(_objBox.values);
    var e = _objBox.get(entityId);
    if (e == null) {
      List<String> values = _objBox.keys.map((e) => e.toString() + "\n").toList();
      print("""didn't find ${this.runtimeType} 
         $entityId
         =================
         $values 
      """);

      // print("");
      // _objBox.values.forEach((element) {
      //   print(element);
      // });
      return null;
    } else {
      var z = _tra(e);
      await z.setPath(this._parent, collectionName);
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
    // list = await _objBox.values.map<CollectionItem>(_tra).toList();

    // print("Path of $CollectionItem is $_collectionPath");
  }

  Future<Box<String>> _waitFor() async {
    // //print("check if box is open");
    //
    // if (1 == 1) {
    //   // print("no");
    //   // String appDocPath = appDocDir.path;
    //   // print(appDocDir.path + _collectionPath);
    //   _objBox =
    //
    //   return;
    // }
    // // print("yes");
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }
    String? x = await secureStorage.read(key: 'key');
    var encryptionKey = base64Url.decode(x!);
    // print('Encryption key: $encryptionKey');
    Directory appDocDir = await getApplicationDocumentsDirectory();
    // if (this is HDMCollection<OrgUser>) {
    //   print("ddddddddddddddddddddddddddddddddd");
    //
    //   print("${appDocDir.path + _collectionPath}");
    //   print("${_collectionPath.split("/").last}");
    // }
    return Hive.openBox(_collectionPath.split("/").last + _parent.entityId.toString(), path: appDocDir.path + _collectionPath, encryptionCipher: HiveAesCipher(encryptionKey));
  }

  bool _isRefreshing = false;
  Future<void> _refresh() async {
    if (!_isRefreshing) {
      _isRefreshing = true;

      Box<String>? _objBox = await _waitFor();

      list = _objBox.values.map<CollectionItem>(_tra).toList();
      DateTime lastTimeUpdated = DateTime(1970);
      list!.forEach((element) {
        if (element.lastTimeEdited.isAfter(lastTimeUpdated)) {
          lastTimeUpdated = element.lastTimeEdited;
        }
      });
      _collectionDocRef = FirebaseFirestore.instance.collection(_collectionPath);
      print("restart");
      //.where('lastTimeEdited', isGreaterThan: lastTimeUpdated.toString())
      await _collectionDocRef.get().then((value) async {
        await _waitFor();
        int i = 0;
        // print("====================================================================================");
        // print("++++++++++++++++++++++++++++++++++++++++++++");
        //
        // print("++++++++++");
        // print("+++");
        // print("              ${CollectionItem}                   ");
        // print(">>>>>>>>>>>>>> ${_collectionDocRef}");
        //
        // print(">>>>>>>>>>>>>> ${value.docs.length}");

        await Future.forEach<QueryDocumentSnapshot<Map<String, dynamic>>>(value.docs, (e) async {
          CollectionItem obj = _traMap(e.data());
          // print( >>obj.entityId);

          // print("id =" + obj.entityId);
          // print("                                            -");
          // print("                                            --");
          // var x = _objBox.values.map<CollectionItem>(_tra).toList();
          // x!.forEach((element) {
          //   print("       ${element.entityId}");
          // });
          //
          // print(value.docs.length.toString());
          // print(obj.runtimeType);
          //
          // print(list!.length.toString());
          // print("${obj.entityId}");
          // print("${_collectionPath.split("/")[_collectionPath.split("/").length - 2]}");
          // print(_objBox.hashCode);
          await _objBox.put(
            obj.entityId,
            jsonEncode(push(obj)),
          );
          // print(list!.length.toString());
          // var x2 = _objBox.values.map<CollectionItem>(_tra).toList();
          // x2!.forEach((element) {
          //   print("       ${element.entityId}");
          // });
          //
          // print("                                            -");
          // print("                                            --");
          i++;
        });
        print("Sucessfuly Loaded $i} ");

        print("lastTimeUpdated$lastTimeUpdated");

        //print("$i,${this.runtimeType} ");
        toast("Sucessfuly Loaded $i");
        print("+++");
        await _waitFor();

        // print("++++++++++");
        // print("++++++++++++++++++++++++++++++++++++++++++++");
        //
        // print("====================================================================================");
      }).timeout(Duration(seconds: 4), onTimeout: () {
        toast("You are Oflline , plz restore connection");
        print("You are Oflline , plz restore connection");
      });
      _isRefreshing = false;
    } else {
      print("Allready refreshing ");
    }
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
    // }).timeout(Duration(seconds: 4), onTimeout: () {
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
    obj.lastTimeEdited = DateTime.now().toUtc();

    await _collectionDocRef.doc(obj.entityId).set(push(obj)).then((value) async {
      Box<String>? _objBox = await _waitFor();

      bool checkMethou() {
        var x = _objBox.values.map<CollectionItem>(_tra).toList();

        var x2 = x.any((element) {
          return element.entityId == obj.entityId;
        });
        return x2;
      }

      // if (checkMethou()) {
      //   ifRebeted == null ? throw {"2 elements with the same id ix it ${this.runtimeType} "} : ifRebeted();
      //   return null;
      // }

      await _objBox.put(
        obj.entityId,
        jsonEncode(push(obj)),
      );

      toast("Sucessfuly added To Local and global Database");
    }).timeout(Duration(seconds: 4), onTimeout: () {
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
      Box<String>? _objBox = await _waitFor();
      list = _objBox.values.map<CollectionItem>(_tra).toList();
      // print("================" + list.toString());
      await Future.forEach<CollectionItem>(list!, _trigerSetChild);
      controller.add(list!);
      return list;
    }

    controller.onListen = () async {
      geter().then((value) => controller.add(value!));
    };

    _waitFor().then((value) async {
      Box<String>? _objBox = await _waitFor();

      _objBox.watch().listen((event) async {
        // print("---------------------------------------------------------------------");
        // print("-");
        //
        // print(_collectionPath.split("/")[2]);
        // //print(event.value["entityId"]);
        //
        // print(jsonDecode(event.value)["entityId"]);
        // print("-");
        //
        // print("---------------------------------------------------------------------");
        geter().then((value) => controller.add(value!));
      });
    });

    controller.onCancel = () {
      controller.close();
    };

    return controller.stream.asBroadcastStream();
  }
}
