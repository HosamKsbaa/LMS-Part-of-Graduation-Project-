//region header
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/Login/SignUpInfo.dart';
import 'package:lms/App/MainPage/AccountsPage.dart';
import 'package:lms/User/UserPriviteDate.dart';
import 'package:lms/User/UserPublicData.dart';
import 'package:lms/organization/GeneralModels/Entity/RootEntity/RootEntity.dart';
import 'package:lms/organization/Organization.dart';
import 'package:overlay_support/overlay_support.dart';

import '../MainControler.dart';
import 'GeneralModels/Entity/entity.dart';

part 'orgnizationAccountControler.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class Appcntroler extends RootEntity {
  Appcntroler() : super("", rootEntityTyps: RootEntityTyps.Appcntroler) {
    orgAccount = HDMCollection<Organization>(this, "Organization");
    userPriviteDateColl = HDMCollection<UserPriviteDate>(this, "userPriviteDate");

    userPublicDataColl = HDMCollection<UserPublicData>(this, "userPublicData");

    setPath(null, "/");
  }
  late UserPriviteDate? usedrPriviteDate;
  late UserPublicData? userPublicData;
  @JsonKey(ignore: true)
  late HDMCollection<Organization> orgAccount;
  @JsonKey(ignore: true)
  late HDMCollection<UserPriviteDate> userPriviteDateColl;
  @JsonKey(ignore: true)
  late HDMCollection<UserPublicData> userPublicDataColl;
  @JsonKey(ignore: true)
  late String userUid;
  @JsonKey(ignore: true)
  User? user;

  Future<bool> afterSuccesLogInChecks({required BuildContext context}) async {
    usedrPriviteDate = await this.userPriviteDateColl.getValLocaly(this.userUid);
    userPublicData = await this.userPublicDataColl.getValLocaly(this.userUid);
    print(">>>>>>>>>>>>>>>Check if he is stored localy");
    assert((usedrPriviteDate == null) == (userPublicData == null));
    if (usedrPriviteDate == null) {
      print(">>>>>>>>>>>>>>>no localy");

      //goto registerPage
      toast("notFound");
      await checkIfUserAlreadyExciteOnLineIfNoRegisterIt(context: context);
      //hDMNavigatorPush(context, SignUpInfoController().data.play);
      // print("usedrPriviteDate $usedrPriviteDate");
      // print("userPublicData $userPublicData");
    } else {
      print(">>>>>>>>>>>>>>>yes localy");
    }
    return true;
    print("sucess ");
  }

  Future<FirebaseApp> initializeFirebase({required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? theUser = FirebaseAuth.instance.currentUser;

    if (theUser != null) {
      user = theUser;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => AccountsPageController().data.play(),
        ),
      );
    }

    return firebaseApp;
  }

  Future<bool> checkIfUserAlreadyExciteOnLineIfNoRegisterIt({required BuildContext context}) async {
    usedrPriviteDate = await this.userPriviteDateColl.getValOnline(this.userUid);
    userPublicData = await this.userPublicDataColl.getValOnline(this.userUid);
    assert((usedrPriviteDate == null) == (userPublicData == null));
    print(">>>>>>>>>>>>>>>Check if he is stored online");

    if (usedrPriviteDate == null) {
      print(">>>>>>>>>>>>>>>no online");

      //goto registerPage
      toast("notFound");
      hDMNavigatorPush(context, SignUpInfoController().data.play);
      print("usedrPriviteDate $usedrPriviteDate");
      print("userPublicData $userPublicData");
      return true;
      // return ;
    } else {
      print(">>>>>>>>>>>>>>>yes online");

      return true;

      //hDMNavigatorPush(context, MainControlerController().data.play);
    }
    //
    //goToMainPage
  }

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? theUser;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential = await auth.signInWithPopup(authProvider);

        theUser = userCredential.user;
        //  checkIfUserAlreadyExciteOnLineIfNoRegisterIt(context: context);
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential = await auth.signInWithCredential(credential);

          theUser = userCredential.user;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            toast("The account already exists with a different credential");
          } else if (e.code == 'invalid-credential') {
            toast("Error occurred while accessing credentials. Try again.");
          }
        } catch (e) {
          toast("Error occurred using Google Sign In. Try again.");
        }
      }
    }

    if (theUser != null) {
      checkIfUserAlreadyExciteOnLineIfNoRegisterIt(context: context);

      user = theUser;
      hDMNavigatorpop(context, MainControlerController().data.play);
    }

    return theUser;
  }

  Future<void> signOut({required BuildContext? context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      userPriviteDateColl.cleanBox();
      userPublicDataColl.cleanBox();
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      toast("Error signing out. Try again.");
    }
  }

  Future<Organization> addOrgnization(String entityId, {required String name}) async {
    var x = Organization(entityId, lastTimeEdited: DateTime.now(), name: name);
    await orgAccount.add(x);
    var theorgAccount = await x.addOwner(userUid);

    this.usedrPriviteDate!.addAnOrgAccountPinter(theorgAccount);
    return x;
  }

  Future<void> LogInFromOnline() async {
    List<UserPriviteDate> z = await userPriviteDateColl.get().first;
    usedrPriviteDate = z.where((element) => element.entityId == userUid).first;

    List<UserPublicData> z2 = await userPublicDataColl.get().first;
    userPublicData = z2.where((element) => element.entityId == userUid).first;
  }

  void LogInFromLocal() {}

  Future<void> SignUp({required BuildContext context, required String firstName, required String lastName, required String gender, required DateTime Birthday, required String PhoneNumber, required String email, required String displayName}) async {
    String userProfilePic = "no";
    String FcmTokens = "no2";

    usedrPriviteDate = UserPriviteDate(gender: gender, Birthday: Birthday, email: email, firstName: firstName, lastName: lastName, PhoneNumber: PhoneNumber, entityTyps: EntityTyps.UserPriviteDate);
    userPublicData = UserPublicData(displayName: displayName, FcmToken: FcmTokens, userProfilePic: userProfilePic, entityTyps: EntityTyps.UserPublicData);
    await userPriviteDateColl.add(usedrPriviteDate!);
    await userPublicDataColl.add(userPublicData!);
    hDMNavigatorpop(context, MainControlerController().data.play);
  }

  //region jsonApi
  factory Appcntroler.fromJson(Map<String, dynamic> json) => _$AppcntrolerFromJson(json);
  Map<String, dynamic> toJson() => _$AppcntrolerToJson(this);
}
//
