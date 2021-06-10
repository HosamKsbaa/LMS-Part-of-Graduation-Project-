import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../OrgAccount.dart';

part 'Student.g.dart';

@JsonSerializable()
class Student extends OrgAccount {
  final List<ClassRoom> classRoomList;

  Student(
    String orgAccountId, {
    this.classRoomList,
    String type = "administrator",
    String orgid,
    List<String> eventpointer,
    DateTime lastTimeEdited,
    Entity parent,
  }) : super(orgAccountId, lastTimeEdited: lastTimeEdited, parent: parent, orgAccountType: type, orgid: orgid);
  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
}
