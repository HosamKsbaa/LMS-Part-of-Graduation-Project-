import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/MainPage/OrgAccounts/PagesForEachOrgAccount/Owner/Owner.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../../Organization.dart';
import '../OrgAccount.dart';

part 'Owner.g.dart';

@JsonSerializable(explicitToJson: true)
class Owner extends OrgAccount {
  Owner(
    String entityId, {
    required OrgAccountType orgAccountType,
    required DateTime lastTimeEdited,
    required String uid,
    required String orgid,
    required EntityTyps entityTyps,
    required ActivitySignetreTyps activitySignetreTyps,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, orgAccountType: OrgAccountType.Owner, orgid: orgid, uid: uid, entityTyps: entityTyps, activitySignetreTyps: activitySignetreTyps);
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
  @override
  void widget({required OrgAccount orgAccount, required Organization org, required BuildContext context}) {
    hDMNavigatorPush(context, OwnerController(ownerAccount: orgAccount, org: org).data.play);
  }
}
