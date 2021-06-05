import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lms/App/Login/LogIn.dart';
import 'package:lms/App/Login/Logic/authentication.dart';
import 'package:lms/App/Login/Widgets/screens/user_info_screen.dart';
import 'package:lms/App/_GeneralMethouds/Navigation.dart';
import 'package:x_bloc2/x_bloc2.dart';

class HDmDrawerController {
//region  Keys
  static const List<HDMKey<HDmDrawerController>> _keyList = [key1];
  HDMMain<HDmDrawerController> data;
  BuildContext context;
  void _start() => data = HDMMain<HDmDrawerController>(this, (HDMBox box) => _WidgetDrawer(this, box), _keyList);
  static const HDMKey<HDmDrawerController> key1 = HDMKey<HDmDrawerController>();

//endregion

  HDmDrawerController() {
    _start();
  }
  bool showUserDetails = false;

  void _moveToUserProfilePage() => hDMNavigatorPush(context, () => UserInfoScreen(user: Authentication.user));
  void _signOut() {
    Authentication.signOut(context: context).then((value) => hDMNavigatorpop(context, LogInController().data.play));
  }
}

class _WidgetDrawer extends HDMStatelessWidget<HDmDrawerController> {
  _WidgetDrawer(HDmDrawerController app, HDMBox box) : super(app, box);

  List<Widget> _buildDrawerList() {
    return <Widget>[
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
    print(Authentication.user.photoURL);
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(Authentication.user.displayName),
                accountEmail: Text(Authentication.user.email),
                onDetailsPressed: () {
                  app.showUserDetails = !app.showUserDetails;
                  app.data.updateTheWholeApp();
                },
                currentAccountPicture: CachedNetworkImage(
                  placeholder: (context, url) => CircularProgressIndicator(),
                  imageUrl: Authentication.user.photoURL,
                ),
              )
            ] +
            (app.showUserDetails ? _buildUserDetail() : _buildDrawerList()),
      ),
    );
  }
}
