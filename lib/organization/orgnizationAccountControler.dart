//region header
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/User/UserPriviteDate.dart';
import 'package:lms/User/UserPublicData.dart';
import 'package:lms/organization/GeneralModels/Entity/RootEntity/RootEntity.dart';
import 'package:lms/organization/Organization.dart';

import 'GeneralModels/Entity/entity.dart';

part 'orgnizationAccountControler.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class Appcntroler extends RootEntity {
  late String userUid;

  Appcntroler() : super("", rootEntityTyps: RootEntityTyps.Appcntroler) {
    orgAccount = HDMCollection<Organization>(this, "Organization");
    //  userPriviteDate = HDMCollection<UserPriviteDate>(this, "userPriviteDate");

    //  userPublicData = HDMCollection<UserPublicData>(this, "userPublicData");

    setPath(null, "/");
  }
  late UserPriviteDate usedrPriviteDate;
  late UserPublicData userPublicData;
  @JsonKey(ignore: true)
  late HDMCollection<Organization> orgAccount;
  @JsonKey(ignore: true)
  late HDMCollection<UserPriviteDate> userPriviteDateColl;
  @JsonKey(ignore: true)
  late HDMCollection<UserPublicData> userPublicDataColl;

  Future<Organization> addOrgnization(String entityId, {required String name}) async {
    var x = Organization(entityId, lastTimeEdited: DateTime.now(), name: name);
    await orgAccount.add(x);
    return x;
  }

  Future<void> LogInFromOnline() async {
    List<UserPriviteDate> z = await userPriviteDateColl.get().first;
    usedrPriviteDate = z.where((element) => element.entityId == userUid).first;

    List<UserPublicData> z2 = await userPublicDataColl.get().first;
    userPublicData = z2.where((element) => element.entityId == userUid).first;
  }

  Future<void> SignUp({
    required String firstName,
    required String lastName,
    required String gender,
    required DateTime Birthday,
    required String PhoneNumber,
    required String email,
    required String displayName,
  }) async {
    String userProfilePic = "no";
    String FcmTokens = "no2";

    usedrPriviteDate = UserPriviteDate(gender: gender, Birthday: Birthday, email: email, firstName: firstName, lastName: lastName, PhoneNumber: PhoneNumber);
    userPublicData = UserPublicData(displayName: displayName, FcmToken: FcmTokens, userProfilePic: userProfilePic);
    await userPriviteDateColl.add(usedrPriviteDate);
    await userPublicDataColl.add(userPublicData);
  }

  void LogInFromLocal() {}

  //region jsonApi
  factory Appcntroler.fromJson(Map<String, dynamic> json) => _$AppcntrolerFromJson(json);
  Map<String, dynamic> toJson() => _$AppcntrolerToJson(this);
}
//
