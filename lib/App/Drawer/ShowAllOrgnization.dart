import 'package:flutter/material.dart';
import 'package:lms/App/MainPage/AccountsPage.dart';
import 'package:lms/main.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import 'Drawer.dart';

class ShowAllOrgnizationController {
//region  Keys
  static const List<HDMKey<ShowAllOrgnizationController>> _keyList = [key1];
  late HDMMain<ShowAllOrgnizationController> data;
  void _start() => data = HDMMain<ShowAllOrgnizationController>(this, (HDMBox<ShowAllOrgnizationController> box) => _WidgetShowAllOrgnization(this, box), _keyList);
  static const HDMKey<ShowAllOrgnizationController> key1 = HDMKey<ShowAllOrgnizationController>();

//endregion
  ShowAllOrgnizationController() {
    _start();
  }
}

class _WidgetShowAllOrgnization extends HDMStatelessWidget<ShowAllOrgnizationController> {
  _WidgetShowAllOrgnization(ShowAllOrgnizationController app, HDMBox<ShowAllOrgnizationController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
          // title: Text("Owner of ${app.org.name}"),
          ),
      body: HDMStreamBuilder<Organization>(
        stream: TheApp.appcntroler.org.get(),
        func: (eS) => Card(
          child: ListTile(
            subtitle: Appcntroler.timeAgo(eS),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.verified_user),
            title: Text(eS.name),
            //subtitle: eS.nameText(r!.),
          ),
        ),
      ),
    );
  }
}
