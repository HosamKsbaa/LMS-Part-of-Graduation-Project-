//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/main.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../Organization.dart';
import 'OrgAccount.dart';

part 'OrgAccountPointer.g.dart';

@JsonSerializable(nullable: true)

//flutter packages pub run build_runner build
//endregion
class OrgAccountPointer extends Entity {
  OrgAccountPointer(String entityId, {required this.orgAccountid, required this.orgAccountType, required EntityTyps entityTyps, required DateTime lastTimeEdited}) : super(entityId, entityTyps: EntityTyps.orgAccountPointer, lastTimeEdited: lastTimeEdited);
  final OrgAccountType orgAccountType;
  final String orgAccountid;

  Future<Organization?> getOrg() async {
    return await TheApp.appcntroler.orgAccount.getValLocaly(orgAccountid);
  }

  void getAccounts() {}
  //region jsonApi
  factory OrgAccountPointer.fromJson(Map<String, dynamic> json) => _$OrgAccountPointerFromJson(json);
  Map<String, dynamic> toJson() => _$OrgAccountPointerToJson(this);
  //endregion
}
