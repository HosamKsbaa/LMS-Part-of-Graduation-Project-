import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../OrgAccount.dart';

part 'Owner.g.dart';

@JsonSerializable(explicitToJson: true)
class Owner extends OrgAccount {
  Owner(
    String orgAccountId, {
    String type = "Owner",
    String orgid,
    List<String> eventpointer,
    DateTime lastTimeEdited,
    Entity parent,
  }) : super(orgAccountId, lastTimeEdited: lastTimeEdited, parent: parent, orgAccountType: type, orgid: orgid);
  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
}
