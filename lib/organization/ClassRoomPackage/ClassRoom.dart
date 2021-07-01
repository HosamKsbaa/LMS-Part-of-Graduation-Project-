import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';
import 'package:lms/organization/orgAccount/OrgAccountPointer.dart';

import 'CourseMaterial/CourseMaterialBlock/CourseMaterialBlock.dart';

part 'ClassRoom.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassRoom extends ActivitySignetre {
  late String classRoomName;

  @JsonKey(ignore: true)
  late HDMCollection<Hidden> hiddenDocs;
  @JsonKey(ignore: true)
  late HDMCollection<CourseMaterialBlock> courseMaterial;

  ClassRoom(String entityId, {required this.classRoomName, required DateTime lastTimeEdited, required ActivitySignetreTyps activitySignetreTyps, required EntityTyps entityTyps}) : super(entityId, lastTimeEdited: lastTimeEdited, activitySignetreTyps: activitySignetreTyps, entityTyps: entityTyps) {
    personalPointer = HDMCollection<OrgAccountPointer>(this, "personalPointer");
    hiddenDocs = HDMCollection<Hidden>(this, "hiddenDocs");
    courseMaterial = HDMCollection<CourseMaterialBlock>(this, "courseMaterial");
  }

  factory ClassRoom.fromJson(Map<String, dynamic> json) => _$ClassRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassRoomToJson(this);

  //region personalPointer
  @JsonKey(ignore: true)
  late HDMCollection<OrgAccountPointer> personalPointer;
  // void addTeacher(Teacher teacher) {
  //   var obj = OrgAccountPointer(
  //     teacher.entityId,
  //     orgAccountid: teacher.entityId,
  //     lastTimeEdited: DateTime.now(),
  //     orgAccountType: OrgAccountType.Teacher,
  //     entityTyps: EntityTyps.orgAccountPointer, pointerTypes: null,
  //   );
  //   personalPointer.add(obj);
  // }

  //endregion
}
