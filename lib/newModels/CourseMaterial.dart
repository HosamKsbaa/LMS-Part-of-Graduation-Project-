//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/newModels/entity.dart';

import 'Log.dart';

part 'CourseMaterial.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class CourseMaterial extends Entity {
  CourseMaterial(String entityId, Map<String, List<AccessLevel>> userUserAccess, List<Log> logList) : super(entityId, userUserAccess, logList);

  //region jsonApi
  factory CourseMaterial.fromJson(Map<String, dynamic> json) => _$CourseMaterialFromJson(json);
  Map<String, dynamic> toJson() => _$CourseMaterialToJson(this);
  //endregion
}
