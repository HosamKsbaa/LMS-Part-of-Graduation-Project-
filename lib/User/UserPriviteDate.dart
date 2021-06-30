//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/main.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgAccountPointer.dart';

part 'UserPriviteDate.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class UserPriviteDate extends Entity {
  UserPriviteDate({required this.firstName, required this.lastName, required this.gender, required this.Birthday, required this.PhoneNumber, required this.email, required EntityTyps entityTyps})
      : super(TheApp.appcntroler.userUid, entityTyps: EntityTyps.UserPriviteDate, lastTimeEdited: DateTime.now()) {
    userOrgnizationAccounts = HDMCollection<OrgAccountPointer>(this, "userOrgnizationAccounts");
  }
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime Birthday;
  final String PhoneNumber;
  final String email;
  @JsonKey(ignore: true)
  late HDMCollection<OrgAccountPointer> userOrgnizationAccounts;

  Future<OrgAccountPointer> addAnOrgAccountPinter(OrgAccount orgAccount) async {
    var x = OrgAccountPointer(orgAccount.entityId, lastTimeEdited: DateTime.now(), entityTyps: orgAccount.entityTyps, orgAccountType: orgAccount.orgAccountType, orgAccountid: orgAccount.entityId);
    await userOrgnizationAccounts.add(x);
    return x;
  }
  //appsettings
  //contacts
  //conversations

  //region jsonApi
  factory UserPriviteDate.fromJson(Map<String, dynamic> json) => _$UserPriviteDateFromJson(json);
  Map<String, dynamic> toJson() => _$UserPriviteDateToJson(this);
  //endregion
}
