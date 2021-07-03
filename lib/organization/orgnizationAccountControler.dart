//region header
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/Login/SignUpInfo.dart';
import 'package:lms/User/UserPriviteDate.dart';
import 'package:lms/User/UserPublicData.dart';
import 'package:lms/organization/GeneralModels/Entity/RootEntity/RootEntity.dart';
import 'package:lms/organization/Organization.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../MainControler.dart';
import '../main.dart';
import 'GeneralModels/Entity/entity.dart';
import 'orgAccount/OrgUser.dart';

part 'orgnizationAccountControler.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class Appcntroler extends RootEntity {
  Appcntroler() : super("", rootEntityTyps: RootEntityTyps.Appcntroler) {
    org = HDMCollection<Organization>(this, "Organization");
    userPriviteDateColl = HDMCollection<UserPriviteDate>(this, "userPriviteDate");

    userPublicDataColl = HDMCollection<UserPublicData>(this, "userPublicData");
    //todo might be a problem
    setPath1();
  }

  Future<bool> setPath1() async {
    await setPath(null, "/");
    return true;
  }

  late UserPriviteDate? usedrPriviteDate;
  late UserPublicData? userPublicData;
  @JsonKey(ignore: true)
  late HDMCollection<Organization> org;
  @JsonKey(ignore: true)
  late HDMCollection<UserPriviteDate> userPriviteDateColl;
  @JsonKey(ignore: true)
  late HDMCollection<UserPublicData> userPublicDataColl;
  @JsonKey(ignore: true)
  late User _user;
  @JsonKey(ignore: true)
  User get user {
    return _user;
  }

  @JsonKey(ignore: true)
  set user(User user) {
    if (user == null) {
      throw {"don't do that "};
    }
    //  print("xxxxxxxxxxxxxxxxxxxxxxx");
    _user = user;
  }

  static Widget timeAgo(Entity e) {
    // var x =DateTime.now().subtract(DateTime.now().difference() );
    return Text("Last Updadted :" + timeago.format(e.lastTimeEdited));
  }

  //late Function refrechTheapp;
  Future<bool> afterSuccesLogInChecks({required BuildContext context}) async {
    //  print(">>>>>>>>>>>>>>>Check if he is stored localy1");

    usedrPriviteDate = await this.userPriviteDateColl.getValLocaly(this.user.uid);
    userPublicData = await this.userPublicDataColl.getValLocaly(this.user.uid);
    // print(">>>>>>>>>>>>>>>Check if he is stored localy2");

    assert((usedrPriviteDate == null) == (userPublicData == null));
    if (usedrPriviteDate == null) {
      print(">>>>>>>>>>>>>>>no localy");

      toast("notFound");
      await checkIfUserAlreadyExciteOnLineIfNoRegisterIt(context: context);
      return true;
    } else {
      print(">>>>>>>>>>>>>>>yes localy");
      return true;

      //  TheApp.appcntroler.refrechTheapp();
    }
    //print("sucess ");
  }

  Future<FirebaseApp> initializeFirebase({required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? theUser = FirebaseAuth.instance.currentUser;

    return firebaseApp;
  }

  Future<bool> checkIfUserAlreadyExciteOnLineIfNoRegisterIt({required BuildContext context}) async {
    print(">>>>>>>>>>>>>>>Check if he is stored online");

    usedrPriviteDate = await this.userPriviteDateColl.getValOnline(this.user.uid);
    userPublicData = await this.userPublicDataColl.getValOnline(this.user.uid);
    // assert((usedrPriviteDate == null) == (userPublicData == null), "");

    if (usedrPriviteDate == null) {
      print(">>>>>>>>>>>>>>>no online");

      //goto registerPage
      toast("notFound");
      hDMNavigatorPush(context, SignUpInfoController().data.play);
      await Future.delayed(const Duration(seconds: 1), () {});
      print("usedrPriviteDate $usedrPriviteDate");
      print("userPublicData $userPublicData");
      return false;
      // return ;
    } else {
      print(">>>>>>>>>>>>>>>yes online");
      // TheApp.appcntroler.refrechTheapp();

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
        await auth.signInWithPopup(authProvider).then((userCredential) {
          theUser = userCredential.user;
        }).timeout(Duration(minutes: 2), onTimeout: () {
          toast("You are Oflline , plz restore connection");
        });

        //  checkIfUserAlreadyExciteOnLineIfNoRegisterIt(context: context);
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn().timeout(Duration(minutes: 2), onTimeout: () {
        toast("You are Oflline , plz restore connection");
      });

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
      user = theUser!;

      await checkIfUserAlreadyExciteOnLineIfNoRegisterIt(context: context);

      hDMNavigatorpop(context, MainControlerController().data.play);
    }

    return theUser;
  }

  Future<void> signOut({required BuildContext? context}) async {
    usedrPriviteDate = null;
    userPublicData = null;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      // userPriviteDateColl.cleanBox();
      //  userPublicDataColl.cleanBox();
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
    await org.add(x);
    // OrgAccount orgAccount = await x.addOwner(user.uid);
    var id = OrgUser.idGenerator(x);
    var theorgUser = await x.addAOrgUser(id);

    theorgUser.displayName = TheApp.appcntroler.userPublicData!.displayName;
    var theorgAccount = await theorgUser.addOwner(user.uid + x.entityId);

    var orgPointer = await this.usedrPriviteDate!.addAnOrganizationPinter(org: x, orgUserCode: id);
    orgPointer.addorgAccountPointer(theorgAccount);
    return x;
  }
  // Future<Organization> connectToAccoun(String entityId, {required String name}) async {
  //   // var x = Organization(entityId, lastTimeEdited: DateTime.now(), name: name);
  //   // await org.add(x);
  //   // // OrgAccount orgAccount = await x.addOwner(user.uid);
  //   //
  //   // var theorgUser = await x.addAOrgUser(user.uid);
  //   // theorgUser.displayName = TheApp.appcntroler.userPublicData!.displayName;
  //   // var theorgAccount = await theorgUser.addOwner(user.uid + x.entityId);
  //
  //   var orgPointer = await this.usedrPriviteDate!.addAnOrganizationPinter(x);
  //   orgPointer.addorgAccountPointer(theorgAccount);
  //   return x;
  // }

  void LogInFromLocal() {}

  Future<void> SignUp({required BuildContext context, required String firstName, required String lastName, required String gender, required DateTime Birthday, required String PhoneNumber, required String email, required String displayName}) async {
    String userProfilePic = "no";
    String FcmTokens = "no2";

    usedrPriviteDate = UserPriviteDate(gender: gender, Birthday: Birthday, email: email, firstName: firstName, lastName: lastName, PhoneNumber: PhoneNumber, entityTyps: EntityTyps.UserPriviteDate);
    userPublicData = UserPublicData(displayName: displayName, FcmToken: FcmTokens, userProfilePic: userProfilePic, entityTyps: EntityTyps.UserPublicData);
    await userPriviteDateColl.add(usedrPriviteDate!);
    await userPublicDataColl.add(userPublicData!);
    print("pop");
    // TheApp.appcntroler.refrechTheapp();

    hDMNavigatorpop(context, MainControlerController().data.play);
  }

  //region jsonApi
  factory Appcntroler.fromJson(Map<String, dynamic> json) => _$AppcntrolerFromJson(json);
  Map<String, dynamic> toJson() => _$AppcntrolerToJson(this);
}
//
