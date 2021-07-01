import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/orgAccount/OrgAccountPointer.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../main.dart';
import '../../organization/orgAccount/OrgAccount.dart';
import '_/AddAnOrg.dart';

class AccountsPageController {
//region  Keys
  static const List<HDMKey<AccountsPageController>> _keyList = [key1];
  late HDMMain<AccountsPageController> data;

  void _start() => data = HDMMain<AccountsPageController>(this, (HDMBox box) => _WidgetAccountsPage(this, box), _keyList);
  static const HDMKey<AccountsPageController> key1 = HDMKey<AccountsPageController>();

//endregion
  AccountsPageController() {
    _start();
  }
  late BuildContext _context;
  List<OrgAccount> accounts = [];
  void addAccount() {
    hDMNavigatorPush(_context, AddAnOrgController().data.play);
  }

  void getOrgAccounts() {}
}

class _WidgetAccountsPage extends HDMStatelessWidget<AccountsPageController> {
  _WidgetAccountsPage(AccountsPageController app, HDMBox box) : super(app, box as HDMBox<AccountsPageController>);

  @override
  Widget build(BuildContext context) {
    app._context = context;

    return Scaffold(
      drawer: HDmDrawerController().data.play(),
      appBar: AppBar(
        title: Text("Accounts"),
      ),
//body: StreamBuilder<List<UserPriviteDate>>(stream: TheApp.appcntroler.userPriviteDateColl.get(), builder: (context, obj) {}),
      body: HDMStreamBuilder<OrgAccountPointer, OrgAccount>(
        stream: TheApp.appcntroler.usedrPriviteDate!.userOrgnizationAccounts.get(),
        err: () => ListTile(
          title: Text("err"),
        ),
        func: (r) => ListTile(
          title: Text(r!.orgid),
        ),
        loading: () => ListTile(
          title: Text("err"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: app.addAccount,
        child: Icon(Icons.add),
      ),
    );
  }
}

class HDMStreamBuilder<x extends HDMPointer, y extends Entity> extends StatelessWidget {
  const HDMStreamBuilder({Key? key, required this.stream, required this.loading, required this.func, required this.err}) : super(key: key);
  final Stream<List<x>>? stream;
  final Widget Function() loading;
  final Widget Function(y?) func;

  final Widget Function() err;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<x>>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<List<x>> snapshot) {
        int counter = 0;
        if (snapshot.hasError) {
          return Center(
            child: Container(
              child: Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
            ),
          );
        } else if (snapshot.hasData) {
          List<x> data = snapshot.data!;
          if (data.length == 0) {
            return Container(
              child: Text("No elements"),
            );
          } else {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) => Column(
                children: [
                  Text("There is ${data.length} elements"),
                  Container(
                    height: constraints.maxHeight * .8,
                    color: Colors.grey,
                    child: ListView(
                      children: data
                          .map((e) => FutureBuilder<Entity?>(
                          future: e.getIt(),
                          builder: (context, builder) {
                            if (builder.hasError) {
                              throw {builder.error};
                              return err();
                            } else if (builder.hasData) {
                              return func(builder.data as y);
                            } else {
                              return loading();
                            }
                          }))
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        }

        return Container(
          child: Center(child: LinearProgressIndicator()),
        );
      },
    );
  }
}
