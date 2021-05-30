import '3_Appsettings.dart';
import 'UserProfile+/2_UserPrivateData.dart';
import 'UserProfile+/2_UserpublicData.dart';

abstract class PersonalProfile {
  UserPublicData userPublicData;
  UserPrivateData userprivatedata;
  AppSettings appSettings;

  //Constructor
  PersonalProfile({UserPublicData userPublicData, UserPrivateData userprivatedata, AppSettings appSettings}) {
    this.userprivatedata = userprivatedata;
    this.appSettings = appSettings;
    this.userPublicData;
  }

  void login() {}

  void signup() {}

  void logout() {}

  void backupYourDataOnGoogleDrive() {}

  void contactAppSup() {}
}
