part of '../../Entity/entity.dart';

enum HDMPointerTypes { OrgAccountPointer, OrgnizationPointer, ClassRoomPointer }

abstract class HDMPointer extends Entity {
  HDMPointer(String entityId, {required this.pointerPath, required this.pointerId, required EntityTyps entityTyps, required this.pointerTypes, required DateTime lastTimeEdited}) : super(entityId, entityTyps: entityTyps, lastTimeEdited: lastTimeEdited);
  final String pointerPath;
  final String pointerId;

  final HDMPointerTypes pointerTypes;
  Future<Entity?> getIt() async {
    print(pointerPath);
    pointerPath.replaceFirst("/", "");
    List<String> thelist = pointerPath.split("/");
    thelist.removeAt(0);
    //
    // thelist.forEach((element) {
    //   print(element.toString());
    // });
    Future<Entity?> getObj(HDMCollection<Entity> collection) async {
      Entity? entity = await collection.getValLocaly(thelist.first);
      thelist.removeAt(0);
      return entity;
    }

    Future<HDMCollection<Entity>> getColection(Entity entity) async {
      HDMCollection<Entity> e = entity._childCollections.firstWhere((e) => e.collectionName == thelist.first);
      thelist.removeAt(0);

      if (thelist.isEmpty) {
        return e;
      } else {
        Entity? x = await getObj(e);
        if (x == null) {
          throw ("error  stuff at $pointerPath is not found");
        } else {
          return getColection(x);
        }
      }
    }

    var v = TheApp.appcntroler;
    var v2 = await getColection(v);
    return v2.getValLocaly(pointerId);
  }

  Map<String, dynamic> toJson();

  factory HDMPointer.fromJson(Map<String, dynamic> json) {
    var x = HDMPointerTypes.values.firstWhere((e) => e.toString().split(".").last == json["pointerTypes"]);

    assert(x != null, "there is no orgAccountType parameter in  ");
    switch (x) {
      case HDMPointerTypes.OrgAccountPointer:
        return OrgAccountPointer.fromJson(json);
        break;
      case HDMPointerTypes.OrgnizationPointer:
        return OrgnizationPointer.fromJson(json);
        break;
      case HDMPointerTypes.ClassRoomPointer:
        return ClassRoomPointer.fromJson(json);
        break;
      default:
        return throw {"Error undefined ${json["orgAccountType"]}}"};
    }
  }
}
