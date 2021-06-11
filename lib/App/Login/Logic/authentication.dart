// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lms/App/MainPage/AccountsPage.dart';

class Authentication {
  static User user;
  static SnackBar customSnackBar({@required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<void> addUser() async {
    DocumentReference userPublicDoc = FirebaseFirestore.instance.collection('User Public Data').doc(Authentication.user.uid);
    DocumentReference userPrivatDoc = FirebaseFirestore.instance.collection('User Private Data').doc(Authentication.user.uid);

    bool exists;

    var doc = await userPublicDoc.get();
    doc.exists ? exists = true : exists = false;

    if (!exists) {
      userPublicDoc
          .set({
            'displayName': user.displayName,
            'FCmToken': "",
            "UserProfilePicURL": user.photoURL,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
      userPrivatDoc
          .set({
            'FirstName': user.displayName,
            'LastName': "",
            'Gender': "",
            'PhoneNumber': "",
            'Email': "",
            'BirthDate': "",
            "UserPersonalPic": "",
            'OrgAccount': [], // John Doe
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
  }

  static Future<FirebaseApp> initializeFirebase({@required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User theUser = FirebaseAuth.instance.currentUser;

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

  static Future<User> signInWithGoogle({@required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User theUser;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential = await auth.signInWithPopup(authProvider);

        theUser = userCredential.user;
        addUser();
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

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
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content: 'The account already exists with a different credential',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              Authentication.customSnackBar(
                content: 'Error occurred while accessing credentials. Try again.',
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            Authentication.customSnackBar(
              content: 'Error occurred using Google Sign In. Try again.',
            ),
          );
        }
      }
    }
    user = theUser;
    if (theUser != null) {
      addUser();
    }
    return theUser;
  }

  static Future<void> signOut({@required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Authentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}
