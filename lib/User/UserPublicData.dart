//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../main.dart';

part 'UserPublicData.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class UserPublicData extends Entity {
  UserPublicData({required this.displayName, required this.userProfilePic, required this.FcmToken}) : super(TheApp.appcntroler.userUid, entityTyps: EntityTyps.UserPriviteDate, lastTimeEdited: DateTime.now());
  final String displayName;
  final String userProfilePic;
  final String FcmToken;

  //region jsonApi
  factory UserPublicData.fromJson(Map<String, dynamic> json) => _$UserPublicDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserPublicDataToJson(this);
  //endregion
}
