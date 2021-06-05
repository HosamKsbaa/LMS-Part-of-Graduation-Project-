class UserProfile {
  String userUid;
  String notificationcode;
  PublicUserData pupUserData;
  PrivateUserData priUserData;
}

class PublicUserData {
  String firstName;
  String lastName;
  String gender;
}

class PrivateUserData {
  DateTime birthDay;
  String phoneNumber;
  String email;
}
