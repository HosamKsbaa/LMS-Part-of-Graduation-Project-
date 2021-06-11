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
    // if (json["hiddenType"] == "student")
    //   return Student.fromJson(json);
    // else if (json["type"] == "parent")
    //   return Parent.fromJson(json);
    // else
    throw {"Error undefined OrgAccount type"};
  }
  Map<String, dynamic> toJson();
  //endregion
}
