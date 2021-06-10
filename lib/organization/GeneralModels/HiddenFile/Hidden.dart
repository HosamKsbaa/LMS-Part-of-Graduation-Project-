import 'package:lms/organization/GeneralModels/Entity/entity.dart';

abstract class Hidden extends Entity {
  final String hiddenType;
  Hidden(this.hiddenType) : super('', '', null);

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
