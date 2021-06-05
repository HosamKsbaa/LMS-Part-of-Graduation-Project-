import 'package:json_annotation/json_annotation.dart';
import 'package:lms/models/Entity.dart';
import 'package:lms/models/Log.dart';
import 'package:lms/models/organization/ClassRoomPackage/ClassRoom.dart';


part 'Organization.g.dart';

@JsonSerializable(explicitToJson: true)

class Organization extends Entity {
  Organization org;
  String Orgid;
  List<UserOrganizationAccount> Personal;
  List<ClassRoom> classroom;

  Organization(
      {this.classroom,
      this.org,
      this.Orgid,
      this.Personal,
      List<Log> log,
      String tagid,
      Map<String, List<AccessLevel>> userTag})
      : super(loglist: log, tagid: tagid, userTag: userTag);

  void addCourse(ClassRoom clas){
    classroom.add(clas);
  }

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
