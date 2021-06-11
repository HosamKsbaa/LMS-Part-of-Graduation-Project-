//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/Organization.dart';

import 'GeneralModels/Entity/entity.dart';

part 'Appcntroler.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class Appcntroler extends Entity {
  Appcntroler() : super("", lastTimeEdited: DateTime.now(), entityTyps: EntityTyps.Appcntroler) {
    orgAccount = HDMCollection<Organization>(this, "Organization");
  }
  @JsonKey(ignore: true)
  late HDMCollection<Organization> orgAccount;

  //region jsonApi
  factory Appcntroler.fromJson(Map<String, dynamic> json) => _$AppcntrolerFromJson(json);
  Map<String, dynamic> toJson() => _$AppcntrolerToJson(this);

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
//
