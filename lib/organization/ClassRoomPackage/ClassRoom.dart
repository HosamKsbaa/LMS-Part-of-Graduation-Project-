import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgAccountPointer.dart';

import 'CourseMaterial/CourseMaterialBlock/Announecmt2/Announecmt.dart';
import 'CourseMaterial/CourseMaterialBlock/CourseMaterialBlock.dart';

part 'ClassRoom.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassRoom extends ActivitySignetre {
  late String classRoomName;

  // @JsonKey(ignore: true)
  // late HDMCollection<Hidden> hiddenDocs;
  @JsonKey(ignore: true)
  late HDMCollection<CourseMaterialBlock> courseMaterial;
  @JsonKey(ignore: true)
  late HDMCollection<OrgAccountPointer> personalPointer;

  ClassRoom(String entityId, {required this.classRoomName, required DateTime lastTimeEdited, required ActivitySignetreTyps activitySignetreTyps, required EntityTyps entityTyps}) : super(entityId, lastTimeEdited: lastTimeEdited, activitySignetreTyps: activitySignetreTyps, entityTyps: entityTyps) {
    personalPointer = HDMCollection<OrgAccountPointer>(this, "personalPointer");
    //  hiddenDocs = HDMCollection<Hidden>(this, "hiddenDocs");
    courseMaterial = HDMCollection<CourseMaterialBlock>(this, "courseMaterial");
  }

  factory ClassRoom.fromJson(Map<String, dynamic> json) => _$ClassRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassRoomToJson(this);

  Future<OrgAccountPointer> addOrgAccountPointer(OrgAccount orgAccount) async {
    var x = OrgAccountPointer(orgAccount.entityId,
        pointerPath: orgAccount.collectionPath, pointerId: orgAccount.entityId, lastTimeEdited: DateTime.now(), entityTyps: EntityTyps.Pointer, pointerTypes: HDMPointerTypes.OrgAccountPointer, orgAccountid: orgAccount.orgid, orgAccountType: orgAccount.orgAccountType);
    await personalPointer.add(x);
    return x;
  }

  // Future<CourseMaterialBlock> addAnQize({required String title}) async {
  //   //todo notify users
  //   var x = CourseMaterialBlock(DateTime.now().toString(), entityTyps: EntityTyps.ActivitySignetre, lastTimeEdited: DateTime.now(), activitySignetreTyps: ActivitySignetreTyps.ClassRoom, title: title, importance: [Importance.toAll], courseMaterialType: CourseMaterialType.Event);
  //   await personalPointer.add(x);
  //   return x;
  // }

  Future<Announecmtextends> addAnAnnouncment({required String text, required String title}) async {
    //todo notify users
    var x = Announecmtextends(DateTime.now().toString(), entityTyps: EntityTyps.ActivitySignetre, lastTimeEdited: DateTime.now(), activitySignetreTyps: ActivitySignetreTyps.ClassRoom, title: title, importance: [Importance.toAll], courseMaterialType: CourseMaterialType.Event, text: text);
    await courseMaterial.add(x);
    return x;
  }

  //region personalPointer

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
