//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/main.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/OrgnizationPointer.dart';
import 'package:overlay_support/overlay_support.dart';

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

  Future<OrgnizationPointer> addAnOrganizationPinter({required Organization org, required String orgUserCode}) async {
    var x = OrgnizationPointer(org.entityId, orgUserCode: orgUserCode, pointerPath: org.collectionPath, pointerId: org.entityId, lastTimeEdited: DateTime.now(), entityTyps: EntityTyps.Pointer, pointerTypes: HDMPointerTypes.OrgnizationPointer, orgid: org.entityId);
    await orgPointer.add(x, ifRebeted: () {
      toast("you are alredy enroled in this org");
    });
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
