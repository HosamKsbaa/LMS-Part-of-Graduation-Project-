import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';

import 'CourseMaterial/CourseMaterialBlock/CourseMaterialBlock.dart';

part 'ClassRoom.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassRoom extends Entity {
  String classRoomName;
  @JsonKey(ignore: true)
  HDMCollection<OrgAccount> personal;
  @JsonKey(ignore: true)
  HDMCollection<Hidden> hiddenDocs;
  @JsonKey(ignore: true)
  HDMCollection<CourseMaterialBlock> courseMaterial;

  ClassRoom({@required this.classRoomName, @required String classRoomId, @required Entity parent}) : super(classRoomId, 'ClassRoom', parent) {
    personal = HDMCollection<OrgAccount>(this, "personal");
    hiddenDocs = HDMCollection<Hidden>(this, "hiddenDocs");
    courseMaterial = HDMCollection<CourseMaterialBlock>(this, "courseMaterial");
  }

  factory ClassRoom.fromJson(Map<String, dynamic> json) => _$ClassRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassRoomToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
}
