import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../OrgAccount.dart';

part 'Parent.g.dart';

@JsonSerializable()
class Parent extends OrgAccount {
  Parent(
    String orgAccountId, {
    String type = "Parent",
    String orgid,
    List<String> eventpointer,
    DateTime lastTimeEdited,
    Entity parent,
  }) : super(orgAccountId, lastTimeEdited: lastTimeEdited, parent: parent, orgAccountType: type, orgid: orgid);

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
