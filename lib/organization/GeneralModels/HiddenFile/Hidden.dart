import 'package:lms/organization/GeneralModels/Entity/entity.dart';

abstract class Hidden extends Entity {
  final String hiddenType;
  Hidden(String entityId, {this.hiddenType, String collection, Entity parent, DateTime lastTimeEdited}) : super(entityId, parent: parent, lastTimeEdited: lastTimeEdited, collection: "hiddenType");

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
