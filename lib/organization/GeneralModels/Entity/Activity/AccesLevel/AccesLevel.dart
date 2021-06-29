//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

part 'AccesLevel.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class AccesLevel extends Entity {
  AccesLevel(String entityId, this.OrgAccountUid, this.accesLevel, DateTime lastTimeEdited) : super(entityId, lastTimeEdited: lastTimeEdited, entityTyps: EntityTyps.AccesLevel);
  final String OrgAccountUid;
  List<AccesLevel> accesLevel;

  //region jsonApi
  factory AccesLevel.fromJson(Map<String, dynamic> json) => _$AccesLevelFromJson(json);
  Map<String, dynamic> toJson() => _$AccesLevelToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
  //endregion
}

enum AccessLevel {
  CanEditeAccesLevel,
  CanReadAccesLevel,
  CanReadLog,
  Read, // R
  right, //w
  delete, //D
  suggestRight, //sr
  suggestDelete,
}
