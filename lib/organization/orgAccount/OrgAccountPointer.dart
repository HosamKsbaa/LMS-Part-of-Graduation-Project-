//region header

import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import 'OrgAccount.dart';

part 'OrgAccountPointer.g.dart';

@JsonSerializable(nullable: true)

//flutter packages pub run build_runner build
//endregion
class OrgAccountPointer extends HDMPointer {
  OrgAccountPointer(String entityId, {required String pointerPath, required String pointerId, required this.orgAccountid, required this.orgAccountType, required EntityTyps entityTyps, required DateTime lastTimeEdited, required HDMPointerTypes pointerTypes})
      : super(entityId, pointerId: pointerId, pointerPath: pointerPath, entityTyps: EntityTyps.Pointer, lastTimeEdited: lastTimeEdited, pointerTypes: HDMPointerTypes.OrgAccountPointer);

  final OrgAccountType orgAccountType;
  final String orgAccountid;

  //void getAccounts() {}
  //region jsonApi
  factory OrgAccountPointer.fromJson(Map<String, dynamic> json) => _$OrgAccountPointerFromJson(json);
  Map<String, dynamic> toJson() => _$OrgAccountPointerToJson(this);
  //endregion
}
