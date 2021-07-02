//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/main.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/OrgnizationPointer.dart';

part 'UserPriviteDate.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class UserPriviteDate extends Entity {
  UserPriviteDate({required this.firstName, required this.lastName, required this.gender, required this.Birthday, required this.PhoneNumber, required this.email, required EntityTyps entityTyps})
      : super(TheApp.appcntroler.user.uid, entityTyps: EntityTyps.UserPriviteDate, lastTimeEdited: DateTime.now()) {
    orgPointer = HDMCollection<OrgnizationPointer>(this, "OrgnizationPointer");
    //print("done1");
  }
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime Birthday;
  final String PhoneNumber;
  final String email;
  @JsonKey(ignore: true)
  late HDMCollection<OrgnizationPointer> orgPointer;

  Future<OrgnizationPointer> addAnOrganizationPinter({required Organization orgAccount, required String orgUserCode}) async {
    var x = OrgnizationPointer(orgAccount.entityId, orgUserCode: orgUserCode, pointerPath: orgAccount.collectionPath, pointerId: orgAccount.entityId, lastTimeEdited: DateTime.now(), entityTyps: orgAccount.entityTyps, pointerTypes: HDMPointerTypes.OrgnizationPointer, orgid: orgAccount.entityId);
    await orgPointer.add(x);
    return x;
  }
  //appsettings
  //contacts
  //conversations

  //region jsonApi
  factory UserPriviteDate.fromJson(Map<String, dynamic> json) {
    // print("done1");

    return _$UserPriviteDateFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserPriviteDateToJson(this);
  //endregion
}
