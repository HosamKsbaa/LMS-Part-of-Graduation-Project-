import 'package:json_annotation/json_annotation.dart';

import 'ClassRoomPackage/ClassRoom.dart';
import 'GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'GeneralModels/Entity/entity.dart';
import 'orgAccount/OrgUser.dart';

part 'Organization.g.dart';

@JsonSerializable()
class Organization extends Entity {
  final String name;
  Organization(String entityId, {required this.name, required DateTime lastTimeEdited, entityTyps: EntityTyps.Organization}) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: EntityTyps.Organization) {
    orgUser = HDMCollection<OrgUser>(this, "OrgUser");
    classroom = HDMCollection<ClassRoom>(this, "classroom");
  }

  //region  ClassRoom

  @JsonKey(ignore: true)
  late HDMCollection<ClassRoom> classroom;
  Future<ClassRoom> addClassroom(String uid, {required String classRoomName}) async {
    var x = ClassRoom(entityId, lastTimeEdited: DateTime.now(), classRoomName: classRoomName, activitySignetreTyps: ActivitySignetreTyps.ClassRoom, entityTyps: EntityTyps.ActivitySignetre);
    await classroom.add(x);
    return x;
  }

  //endregion
  //region   OrgAccount
  @JsonKey(ignore: true)
  late HDMCollection<OrgUser> orgUser;

  Future<OrgUser> addAOrgUser(String id) async {
    var x = OrgUser(id, lastTimeEdited: DateTime.now(), entityTyps: EntityTyps.ActivitySignetre, activitySignetreTyps: ActivitySignetreTyps.OrgUser);
    x.org = this;
    await orgUser.add(x);

    return x;
  }

  Future<OrgUser> connectTo(String id) async {
    var x = OrgUser(OrgUser.idGenerator(this), lastTimeEdited: DateTime.now(), entityTyps: EntityTyps.ActivitySignetre, activitySignetreTyps: ActivitySignetreTyps.OrgUser);
    x.org = this;
    await orgUser.add(x);
    return x;
  }

  //endregion

  @override
  void firstTimeInit() {}

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }

  @override
  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
//endregion
}
