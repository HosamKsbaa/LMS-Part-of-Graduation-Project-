class UserPublicData{
String first_name;
String last_name;
String userProfilePicture;
String userUid;
String fcmToken;

//Constructor
UserPublicData(
String first_name,
String last_name,
String userProfilePicture,
String userUid,
String fcmToken
){
  this.first_name =first_name;
  this.last_name =last_name;
  this.userProfilePicture= userProfilePicture;
  this.userUid =userUid;
  this.fcmToken =fcmToken;
}



void editData({String fname,String lname ,String picture}) {
  // still under testing
  if(fname !=null && lname ==null && picture == null)
  this.first_name =fname;
  else if(lname !=null && fname ==null && picture == null)
  this.last_name=lname;
  else if(picture != null && lname ==null && fname == null)
  this.userProfilePicture = picture;
  else if(picture == lname && lname == fname  && fname == null)
    return;
  else
    this.first_name =fname;
    this.last_name=lname;
    this.userProfilePicture =picture;
}

}