import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_bloc/x_bloc.dart';
import 'package:x_misters/Apps/innerApps/students/Students.dart';

import '_____________/Login.dart';
import '_____________/ui/GoogleSingInButton/googleSignin.dart';

part '_____________/ui/GoogleSingInButton/googleSinInButton.dart';

//todo Read the instructions

class FireBaseLogin {
  HDM<FireBaseLogin> data;
  String userStates;
  BuildContext context;

  ///it is passed from the widget

  FireBaseLogin() {
    data = HDM<FireBaseLogin>(this, _fireBaseLoginWidget);
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        userSignedOut();
      } else {
        //assert(context != null);
        userSignIn();
      }
    });
    _googleSignIn = GoogleSignInLogic(_auth);
  }

  void userSignedOut() {
    print('User is currently signed out!');
    userStates = "signed out";
    data.update([0]);
  }

  void userSignIn() {
    print('User is signed in!');
    userStates = "signed in";
    // void getDataromLocalStorage (){
    //
    // }
    //
    // if(0==0){///didn't find local storage
    //
    //   if(){ ///found it on
    //
    //   }
    //   else{
    //
    //   }
    // }
    // else{///found it
    //   ///see what is your type and go
    // }
    //

    Login l = Login();
    Get.off(l.data.play());
    Students _students = Students();

    Get.off(_students.data.play());

    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => l.data.play()));
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignInLogic _googleSignIn;
  UserCredential userCredential;

  Future<void> signInWithGoogle() async {
    userCredential = await _googleSignIn.signInWithGoogle();
  }

  Future<void> signOutWithGoogle() async {
    _googleSignIn.signOutGoogle();
  }

  // Future<void> signInWithPhoneNumber() async {
  //   userCredential = await _googleSignIn.signInWithGoogle();
  // }
  //
  // Future<void> signOutWithPhoneNumber() async {
  //   _googleSignIn.signOutGoogle();
  // }  ////

  Future<void> sinUpAnonymously() async {
    userCredential = await FirebaseAuth.instance.signInAnonymously();
  }
}

Builder _fireBaseLoginWidget(StateMain<FireBaseLogin> s) {
  return Builder(builder: (context) {
    s.h.context = context;
    return Scaffold(
      body: Container(
        child: Center(
          child: Card(
            child: Container(
              width: context.width * .9,
              height: context.height * .6,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Sing in to ",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Edulotion",
                          style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    // RaisedButton(
                    //   onPressed: s.h.sinUpAnonymously,
                    //   child: Text(" Anounomes"),
                    //   color: Colors.green,
                    // ),
                    _googlesignInButton(s.h.signInWithGoogle),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  });
}
