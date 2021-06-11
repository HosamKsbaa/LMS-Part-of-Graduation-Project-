//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

part 'Log.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build --delete-conflicting-outputs
//endregion
class Log extends Entity {
  final String orgAccountId;
  final String entityId;
  final Map event;

  Log(this.entityId, {required DateTime lastTimeEdited, required this.orgAccountId, required this.event}) : super(DateTime.now().toString(), lastTimeEdited: lastTimeEdited, entityTyps: EntityTyps.Log);
  //region jsonApi
  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
  Map<String, dynamic> toJson() => _$LogToJson(this);

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
