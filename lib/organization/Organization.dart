import 'package:json_annotation/json_annotation.dart';

import 'ClassRoomPackage/ClassRoom.dart';
import 'GeneralModels/Entity/entity.dart';
import 'orgAccount/OrgAccount.dart';

part 'Organization.g.dart';

@JsonSerializable(explicitToJson: true)
class Organization extends Entity {
  final String name;

  //region  complex Hosam stuff
  @JsonKey(ignore: true)
  HDMCollection<OrgAccount> personal;
  @JsonKey(ignore: true)
  HDMCollection<ClassRoom> classroom;

  Organization({this.name, String organizationId}) : super(organizationId, "organization", null) {
    personal = HDMCollection<OrgAccount>(this, "personal");
    classroom = HDMCollection<ClassRoom>(this, "classroom");
  }

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
  @override
  void firstTimeInit() {}

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }

//endregion
}
