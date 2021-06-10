import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ClassRoomPackage/ClassRoom.dart';
import 'GeneralModels/Entity/entity.dart';
import 'orgAccount/OrgAccount.dart';

part 'Organization.g.dart';

@JsonSerializable()
class Organization extends Entity {
  final String name;

  //region  complex Hosam stuff
  @JsonKey(ignore: true)
  HDMCollection<OrgAccount> personal;
  @JsonKey(ignore: true)
  HDMCollection<ClassRoom> classroom;

  Organization(
    String organizationId, {
    @required this.name,
    @required DateTime lastTimeEdited,
    @required Entity parent,
  }) : super(organizationId, lastTimeEdited: lastTimeEdited) {
    personal = HDMCollection<OrgAccount>(this, "personal");
    classroom = HDMCollection<ClassRoom>(this, "classroom");
  }

  @override
  void firstTimeInit() {}

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

//endregion
}
