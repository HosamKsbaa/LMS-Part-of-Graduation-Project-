import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/QestionsFile.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/StudentAnsersFile/AnswerFile.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

enum HiddenType {
  AnserFile,
  qestionFile,
}

abstract class Hidden extends Entity {
  final HiddenType hiddenType;
  Hidden(String entityId, {required this.hiddenType, required DateTime lastTimeEdited}) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: EntityTyps.Hidden);

  //region jsonApi
  factory Hidden.fromJson(Map<String, dynamic> json) {
    var x = HiddenType.values.firstWhere((e) {
      return e.toString().split(".").last == json["hiddenType"];
    });
    assert(x != null, "there is no hiddentType parameter in  ");
    switch(x){
      case HiddenType.AnserFile:
        return AnswerFile.fromJson(json);
      case HiddenType.qestionFile:
        return QestionsFile.fromJson(json);
      default:
        return throw {"Error undefined ${json["hiddenType"]}"};
    }
  }
  Map<String, dynamic> toJson();
  //endregion
}
