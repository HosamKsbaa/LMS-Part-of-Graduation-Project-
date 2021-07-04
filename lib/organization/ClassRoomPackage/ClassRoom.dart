import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';
import 'package:lms/organization/orgAccount/OrgAccountPointer.dart';

import 'CourseMaterial/CourseMaterialBlock/Announecmt2/Announecmt.dart';
import 'CourseMaterial/CourseMaterialBlock/CourseMaterialBlock.dart';
import 'CourseMaterial/CourseMaterialBlock/Event/Event.dart';
import 'CourseMaterial/CourseMaterialBlock/Event/Qize/Quiz2.dart';

part 'ClassRoom.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassRoom extends ActivitySignetre {
  late String classRoomName;

  // @JsonKey(ignore: true)
  // late HDMCollection<Hidden> hiddenDocs;
  @JsonKey(ignore: true)
  late HDMCollection<CourseMaterialBlock> courseMaterialBlock;
  @JsonKey(ignore: true)
  late HDMCollection<OrgAccountPointer> personalPointer;

  ClassRoom(String entityId, {required this.classRoomName, required DateTime lastTimeEdited, required ActivitySignetreTyps activitySignetreTyps, required EntityTyps entityTyps}) : super(entityId, lastTimeEdited: lastTimeEdited, activitySignetreTyps: activitySignetreTyps, entityTyps: entityTyps) {
    personalPointer = HDMCollection<OrgAccountPointer>(this, "personalPointer");
    //  hiddenDocs = HDMCollection<Hidden>(this, "hiddenDocs");
    courseMaterialBlock = HDMCollection<CourseMaterialBlock>(this, "courseMaterial");
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
    var x = Announecmtextends(DateTime.now().toString(),
        entityTyps: EntityTyps.ActivitySignetre, lastTimeEdited: DateTime.now(), activitySignetreTyps: ActivitySignetreTyps.CourseMaterialBlock, title: title, importance: [Importance.toAll], courseMaterialType: CourseMaterialType.Announecmtextends, text: text);
    await courseMaterialBlock.add(x);
    return x;
  }

  Future<Quiz> addaQize({required String title}) async {
    //todo notify users
    var x = Quiz(DateTime.now().toString(), entityTyps: EntityTyps.ActivitySignetre, lastTimeEdited: DateTime.now(), activitySignetreTyps: ActivitySignetreTyps.Quiz, importance: [Importance.toAll], courseMaterialType: CourseMaterialType.Event, title: title, eventType: LMSEventType.Quiz);
    await courseMaterialBlock.add(x);
    return x;
  }
  //
  // Future<Quiz> addQuiz({required String text, required String title}) async {
  //   //todo notify users
  //   var x = Quiz(DateTime.now().toString(), entityTyps: EntityTyps.ActivitySignetre, lastTimeEdited: DateTime.now(), activitySignetreTyps: ActivitySignetreTyps.ClassRoom, title: title, importance: [Importance.toAll], courseMaterialType: CourseMaterialType.Event);
  //   await courseMaterial.add(x);
  //   return x;
  // }
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
