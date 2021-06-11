import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../Appcntroler.dart';

typedef _AsyncCallback = Future<void> Function();
enum EntityTyps {
  Organization,
  Appcntroler,
  ActivitySignetre,
  AccesLevel,
  Log,
  Hidden,
}

abstract class Entity {
  @mustCallSuper
  Entity(this.entityId, {required this.entityTyps, required this.lastTimeEdited}) {
    if (this is Appcntroler) {
      print(this.runtimeType);

      collectionPath = "/";
    }
  }

  bool _waitForDone = false;
  final entityTyps;
  DateTime lastTimeEdited;
  Entity? _parent;
  late String collectionPath;
  @required
  final String entityId;

  late DocumentReference _entityDocRef;

  //region watingFor
  List<_AsyncCallback> _waitForList = [];
  Future<void> waitFor() async {
    if (_parent != null) {
      //firestobj

      try {
        _entityDocRef = FirebaseFirestore.instance.doc(collectionPath + '/' + entityId);
      } catch (e) {
        toast("erro ${collectionPath + entityId} path dosn't work $e ");

        throw {"erro ${collectionPath + entityId} path dosn't work $e "};
      }
    }

    _waitForList.forEach((e) async => await e());
    await subWaitFor();
    _waitForDone = true;
  }

  //endregion
  //region   reFresj
  List<_AsyncCallback> _reFreshForList = [];

  Future<void> reFresh() async {
    try {
      _reFreshForList.forEach((e) async => await e());
    } catch (e) {
      //todo delete all data if opration fail
      toast("there is an error on collection $Entity $e");
    }
  }

  //endregion

  void _setPath(Entity parent, collection) {
    _parent = parent;
    if (this is Organization) {
      print(this.runtimeType);

      collectionPath = '/Organization';
    } else if (_parent == null) {
      throw {"Has No paretn ${this.runtimeType}"};
    } else {
      collectionPath = _parent!.collectionPath + "/" + _parent!.entityId + "/" + collection;
    }
    print("Path of $Entity is $collectionPath <<<<<<<<<<<");
    //print(path);
  }

  FutureOr<void> subWaitFor();

  void firstTimeInit();

  factory Entity.fromJson(Map<String, dynamic> json) {
    switch (json["orgAccountType"] as EntityTyps) {
      case EntityTyps.Organization:
        return OrgAccount.fromJson(json);
        break;
      case EntityTyps.Appcntroler:
        return OrgAccount.fromJson(json);
        break;
      case EntityTyps.ActivitySignetre:
        return OrgAccount.fromJson(json);
        break;
      case EntityTyps.AccesLevel:
        return OrgAccount.fromJson(json);
        break;
      case EntityTyps.Log:
        return OrgAccount.fromJson(json);
        break;
      case EntityTyps.Hidden:
        return OrgAccount.fromJson(json);
        break;
      default:
        return throw {"Error undefined ${json["orgAccountType"]}}"};
    }
  }

  Map<String, dynamic> toJson();
}

class HDMCollection<CollectionItem extends Entity> {
  final Entity _parent;
  final String collectionName;
  late String _collectionPath;

  late CollectionReference _collectionDocRef;
  late Box<String> objBox;

  HDMCollection(this._parent, this.collectionName) {
    this._parent._waitForList.add(_waitFor);
    this._parent._reFreshForList.add(refresh);

    if (this is HDMCollection<Organization>) {
      print(this.runtimeType);

      _collectionPath = '/Organization';
    } else {
      print(this.runtimeType);

      _collectionPath = _parent.collectionPath + '/' + _parent.entityId + '/' + collectionName;
    }
    print("Path of $CollectionItem is $_collectionPath");
  }

  Future<void> _waitFor() async {
    objBox = await Hive.openBox(_collectionPath.replaceAll('/', "%%"));
  }

  Future<void> add(CollectionItem obj) async {
    //if (_parent._waitForDone == false) throw {"not initilized ${this.runtimeType}"};
    // bool succes = false;
    obj._setPath(_parent, collectionName);

    _collectionDocRef = FirebaseFirestore.instance.collection(_collectionPath);
    obj.lastTimeEdited = DateTime.now();
    await _collectionDocRef.doc(obj.entityId).set(obj.toJson());
    objBox = await Hive.openBox(_collectionPath.replaceAll('/', "%%"));
    await objBox.put(
      obj.entityId,
      jsonEncode(obj.toJson()),
    );
    void _injectParent(CollectionItem collectionItem) {
      return collectionItem._setPath(_parent, collectionName);
    }
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

  Future<void> refresh() async {
    //todo check the last log and get all things from it to now
  }

  Stream<List<CollectionItem>> get() {
    CollectionItem tra(String e) {
      var x = Entity.fromJson(jsonDecode(e));
      x._setPath(_parent, collectionName);
      return x as CollectionItem;
    }

    StreamController<List<CollectionItem>> controller = StreamController<List<CollectionItem>>();

    controller.add(objBox.values.map<CollectionItem>(tra).toList());

    objBox.watch().listen((event) {
      controller.add(objBox.values.map<CollectionItem>(tra).toList());
    });

    controller.onCancel = () {
      controller.close();
    };

    return controller.stream.asBroadcastStream();
  }
}
