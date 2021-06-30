import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../OrgAccount.dart';

part 'Parent.g.dart';

@JsonSerializable()
class Parent extends OrgAccount {
  Parent(
    String entityId, {
    required OrgAccountType orgAccountType,
    required DateTime lastTimeEdited,
    required String uid,
    required String orgid,
    required EntityTyps entityTyps,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, orgAccountType: OrgAccountType.Parent, orgid: orgid, uid: uid, entityTyps: entityTyps);

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
}
