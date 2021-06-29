import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';

import '../OrgAccount.dart';

part 'Student.g.dart';

@JsonSerializable(nullable: true)
class Student extends OrgAccount {
  final List<ClassRoom> classRoomList;

  Student(
    String entityId, {
    required this.classRoomList,
    required OrgAccountType orgAccountType,
    required DateTime lastTimeEdited,
    required String uid,
    required String orgid,
  }) : super(entityId, lastTimeEdited: lastTimeEdited, orgAccountType: OrgAccountType.Student, orgid: orgid, uid: uid);
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
