import 'package:json_annotation/json_annotation.dart';

import 'ClassRoomPackage/ClassRoom.dart';
import 'GeneralModels/Entity/Log.dart';
import 'GeneralModels/Entity/entity.dart';
import 'orgAccount/OrgAccount.dart';

part 'Organization.g.dart';

@JsonSerializable(explicitToJson: true)
class Organization extends Entity {
  Organization org;
  String Orgid;
  List<OrgAccount> Personal;
  List<ClassRoom> classroom;

  Organization({this.classroom, this.org, this.Orgid, this.Personal, List<Log> log, String entityId, Map<String, List<AccessLevel>> userUserAccess}) : super(logList: log, entityId: entityId, userUserAccess: userUserAccess);

  void addCourse(ClassRoom clas) {
    classroom.add(clas);
  }

  factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
