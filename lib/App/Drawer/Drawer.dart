import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/App/Login/LogIn.dart';
import 'package:lms/App/Login/Widgets/screens/user_info_screen.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../main.dart';
import 'ShowAllOrgnization.dart';

class HDmDrawerController {
//region  Keys
  static const List<HDMKey<HDmDrawerController>> _keyList = [key1];
  late HDMMain<HDmDrawerController> data;
  BuildContext? context;
  void _start() => data = HDMMain<HDmDrawerController>(this, (HDMBox box) => _WidgetDrawer(this, box), _keyList);
  static const HDMKey<HDmDrawerController> key1 = HDMKey<HDmDrawerController>();

//endregion

  HDmDrawerController() {
    _start();
  }
  bool showUserDetails = false;

  void _moveToUserProfilePage() => hDMNavigatorPush(context!, () => UserInfoScreen(user: TheApp.appcntroler.user));
  void _signOut() {
    TheApp.appcntroler.signOut(context: context).then((value) => hDMNavigatorpop(context!, LogInController().data.play));
  }
}

class _WidgetDrawer extends HDMStatelessWidget<HDmDrawerController> {
  _WidgetDrawer(HDmDrawerController app, HDMBox box) : super(app, box as HDMBox<HDmDrawerController>);

  List<Widget> _buildDrawerList() {
    return <Widget>[
      ListTile(
        title: Text('all oeg in the app '),
        onTap: () {
          hDMNavigatorPush(box.context, ShowAllOrgnizationController().data.play);
        },
      ),
      ListTile(
        title: Text('Item 1'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
      ListTile(
        title: Text('Item 2'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ];
  }

  List<Widget> _buildUserDetail() {
    return <Widget>[
      ListTile(
        title: Text('User profile'),
        leading: Icon(Icons.account_box),
        onTap: app._moveToUserProfilePage,
      ),
      ListTile(
        title: Text('signOut'),
        leading: Icon(Icons.logout),
        onTap: app._signOut,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    app.context = context;
    //  print(TheApp.appcntroler.user!.photoURL);
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(TheApp.appcntroler.user.displayName!),
                accountEmail: Text(TheApp.appcntroler.user.email!),
                onDetailsPressed: () {
                  app.showUserDetails = !app.showUserDetails;
                  app.data.updateTheWholeApp();
                },
                currentAccountPicture: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: TheApp.appcntroler.user.photoURL!,
                ),
              )
            ] +
            (app.showUserDetails ? _buildUserDetail() : _buildDrawerList()),
      ),
    );
  }
}
