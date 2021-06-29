import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:lms/User/UserPriviteDate.dart';
import 'package:lms/User/UserPublicData.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgAccountPointer.dart';
import 'package:overlay_support/overlay_support.dart';

import 'RootEntity/RootEntity.dart';

enum EntityTyps {
  Organization,
  // Appcntroler,
  ActivitySignetre,
  AccesLevel,
  Log,
  Hidden,
  orgAccountPointer,
  RootEntity,
  UserPriviteDate,
  UserPublicData,
}

abstract class Entity {
  @mustCallSuper
  Entity(this.entityId, {required this.entityTyps, required this.lastTimeEdited});

  final EntityTyps entityTyps;
  DateTime lastTimeEdited;
  Entity? _parent;
  late String collectionPath;
  @required
  final String entityId;
  final List<HDMCollection> _childCollections = [];

  late DocumentReference _entityDocRef;

  void setPath(Entity? parent, collection) {
    _parent = parent;

    if (this is RootEntity) {
      print(this.runtimeType);
      collectionPath = "/";
    } else if (this is Organization) {
      print(this.runtimeType);

      collectionPath = '/Organization';
    } else if (_parent == null) {
      throw {"Has No paretn ${this.runtimeType}"};
    } else {
      collectionPath = _parent!.collectionPath + "/" + _parent!.entityId + "/" + collection;
    }
    try {
      _childCollections.forEach((e) => e._setIt());
    } catch (e) {
      //todo delete all data if opration fail
      toast("there is an error on collection $Entity $e");
    }
    print("Path of $Entity is $collectionPath <<<<<<<<<<<");
    //print(path);
  }

  Future<void> _waitFor() async {
    if (_parent != null) {
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
      //todo delete all data if opration fail
      toast("there is an error on collection $Entity $e");
    }
  }

  factory Entity.fromJson(Map<String, dynamic> json) {
    switch (json["orgAccountType"] as EntityTyps) {
      case EntityTyps.Organization:
        return OrgAccount.fromJson(json);
        break;
      case EntityTyps.RootEntity:
        return RootEntity.fromJson(json);
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
      case EntityTyps.orgAccountPointer:
        return OrgAccountPointer.fromJson(json);
        break;
      case EntityTyps.UserPublicData:
        return UserPublicData.fromJson(json);
        break;
      case EntityTyps.UserPriviteDate:
        return UserPriviteDate.fromJson(json);
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
  late Box<String> _objBox;

  HDMCollection(this._parent, this.collectionName) {
    _parent._childCollections.add(this);
  }

  Future<void> _trigerSetChild(CollectionItem obj) async {
    obj.setPath(_parent, collectionName);
    await obj._waitFor();
  }

  void _setIt() {
    print("$this is set ");
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
    _objBox = await Hive.openBox(_collectionPath.replaceAll('/', "%%"));
  }

  Future<void> _refresh() async {
    //todo check the last log and get all things from it to now
  }

  Future<void> add(CollectionItem obj) async {
    //if (_parent._waitForDone == false) throw {"not initilized ${this.runtimeType}"};
    // bool succes = false;
    print(">>>>>>>>>$this is set ");

    await _trigerSetChild(obj);
    _collectionDocRef = FirebaseFirestore.instance.collection(_collectionPath);
    obj.lastTimeEdited = DateTime.now();
    await _collectionDocRef.doc(obj.entityId).set(obj.toJson());
    _objBox = await Hive.openBox(_collectionPath.replaceAll('/', "%%"));
    await _objBox.put(
      obj.entityId,
      jsonEncode(obj.toJson()),
    );
    void _injectParent(CollectionItem collectionItem) {
      return collectionItem.setPath(_parent, collectionName);
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

  Stream<List<CollectionItem>> get() {
    StreamController<List<CollectionItem>> controller = StreamController<List<CollectionItem>>();

    Future<List<CollectionItem>> geter() async {
      CollectionItem tra(String e) {
        return Entity.fromJson(jsonDecode(e)) as CollectionItem;
      }

      var x = _objBox.values.map<CollectionItem>(tra).toList();
      await Future.forEach<CollectionItem>(x, _trigerSetChild);
      controller.add(x);
      return x;
    }

    controller.onListen = () async {
      geter().then((value) => controller.add(value));
    };

    _objBox.watch().listen((event) async {
      geter().then((value) => controller.add(value));
    });

    controller.onCancel = () {
      controller.close();
    };

    return controller.stream.asBroadcastStream();
  }
}
