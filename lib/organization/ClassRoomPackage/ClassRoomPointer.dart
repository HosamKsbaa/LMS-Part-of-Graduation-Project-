//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

part 'ClassRoomPointer.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class ClassRoomPointer extends HDMPointer {
  ClassRoomPointer(String entityId, {required String pointerPath, required String pointerId, required EntityTyps entityTyps, required DateTime lastTimeEdited, required HDMPointerTypes pointerTypes})
      : super(entityId, pointerId: pointerId, pointerPath: pointerPath, entityTyps: entityTyps, lastTimeEdited: lastTimeEdited, pointerTypes: pointerTypes);

//region jsonApi
  factory ClassRoomPointer.fromJson(Map<String, dynamic> json) => _$ClassRoomPointerFromJson(json);
  Map<String, dynamic> toJson() => _$ClassRoomPointerToJson(this);
  //endregion
}
