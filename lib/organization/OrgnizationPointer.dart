//region header
import 'package:json_annotation/json_annotation.dart';

import 'GeneralModels/Entity/entity.dart';
import 'orgAccount/OrgAccount.dart';
import 'orgAccount/OrgAccountPointer.dart';

part 'OrgnizationPointer.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class OrgnizationPointer extends HDMPointer {
  OrgnizationPointer(String entityId, {required this.orgUserCode, required this.orgid, required String pointerPath, required String pointerId, required EntityTyps entityTyps, required DateTime lastTimeEdited, required HDMPointerTypes pointerTypes})
      : super(entityId, pointerId: pointerId, pointerPath: pointerPath, entityTyps: EntityTyps.Pointer, lastTimeEdited: lastTimeEdited, pointerTypes: HDMPointerTypes.OrgnizationPointer) {
    orgAccountPointer = HDMCollection<OrgAccountPointer>(this, "orgAccountPointer");
  }

  final String orgid;
  final String orgUserCode;
  @JsonKey(ignore: true)
  late HDMCollection<OrgAccountPointer> orgAccountPointer;
  Future<OrgAccountPointer> addorgAccountPointer(OrgAccount orgAccount) async {
    var x = OrgAccountPointer(orgAccount.uid,
        pointerPath: orgAccount.collectionPath, pointerId: orgAccount.entityId, lastTimeEdited: DateTime.now(), entityTyps: orgAccount.entityTyps, orgAccountType: orgAccount.orgAccountType, orgAccountid: orgAccount.entityId, pointerTypes: HDMPointerTypes.OrgAccountPointer);

    await orgAccountPointer.add(x);

    return x;
  }

  //region jsonApi
  factory OrgnizationPointer.fromJson(Map<String, dynamic> json) => _$OrgnizationPointerFromJson(json);
  Map<String, dynamic> toJson() => _$OrgnizationPointerToJson(this);
  //endregion
}
