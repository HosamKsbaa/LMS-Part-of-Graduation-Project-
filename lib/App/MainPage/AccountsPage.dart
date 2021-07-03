import 'package:flutter/material.dart';
import 'package:lms/App/Drawer/Drawer.dart';
import 'package:lms/App/General/_GeneralMethouds/Navigation.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/Organization.dart';
import 'package:lms/organization/OrgnizationPointer.dart';
import 'package:lms/organization/orgnizationAccountControler.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../main.dart';
import '../../organization/orgAccount/OrgAccount.dart';
import 'OrgAccounts/OrgAccounts.dart';
import '_/AddAnPrgOrConnect.dart';

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
        title: Text("All orgnizationn"),
      ),
//body: StreamBuilder<List<UserPriviteDate>>(stream: TheApp.appcntroler.userPriviteDateColl.get(), builder: (context, obj) {}),
      body: HDMStreamBuilderForPointers<OrgnizationPointer, Organization>(
        stream: TheApp.appcntroler.usedrPriviteDate!.orgPointer.get(),
        err: () => ListTile(title: Text("err")),
        func: (Org, orgPointer) => Card(
          child: ListTile(
            onTap: () {
              hDMNavigatorPush(context, OrgAccountsController(orgnizationPointer: orgPointer, org: Org).data.play);
            },
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            leading: Icon(Icons.school),
            title: Text(Org.name),
            subtitle: Appcntroler.timeAgo(Org),
            //subtitle: Text(r!.),
          ),
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

class HDMStreamBuilderForPointers<x extends HDMPointer, y extends Entity> extends StatelessWidget {
  const HDMStreamBuilderForPointers({Key? key, required this.stream, required this.loading, required this.func, required this.err}) : super(key: key);
  final Stream<List<x>>? stream;
  final Widget Function() loading;
  final Widget Function(y, x) func;

  final Widget Function() err;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<x>>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<List<x>> snapshot) {
        int counter = 0;
        if (snapshot.hasError) {
          throw {snapshot.error};

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
            return  NoContent();
          } else {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) => Column(
                children: [
                  Text("There is ${data.length} elements last update ${DateTime.now()}"),
                  Expanded(
                    child: ListView(
                      children: data
                          .map((e) => FutureBuilder<Entity?>(
                              future: e.getIt(),
                              builder: (context, builder) {
                                if (builder.hasError) {
                                  throw {builder.error};
                                  return err();
                                } else if (builder.hasData) {
                                  return func(builder.data as y, e);
                                } else {
                                  return loading();
                                }
                              }))
                          .toList(),
                    ),
                  )
                ],
              ),
            );
          }
        }

        return CirclerWaiting();
      },
    );
  }
}

class HDMStreamBuilder<x extends Entity> extends StatelessWidget {
  const HDMStreamBuilder({Key? key, required this.stream, required this.func}) : super(key: key);
  final Stream<List<x>>? stream;
  final Widget Function(x) func;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<x>>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<List<x>> snapshot) {
        int counter = 0;
        if (snapshot.hasError) {
          throw {snapshot.error};

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
          // print("======================================== ${x.runtimeType}");
          // data.forEach((element) {
          //   print(element.toJson());
          // });
          // print("================================");
          if (data.length == 0) {
            return NoContent();
          } else {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) => Column(
                children: [

                  Text("There is ${data.length} elements last update ${DateTime.now()}"),
                  Expanded(
                    child: ListView(
                      children: data.map((e) => func(e)).toList(),
                    ),
                  )
                ],
              ),
            );
          }
        }

        return CirclerWaiting();
      },
    );
  }
}

class CirclerWaiting extends StatelessWidget {
  const CirclerWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: LinearProgressIndicator()),
    );
  }
}

class NoContent  extends StatelessWidget {
  const NoContent ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Click on the "),
                Icon(Icons.add_circle_outline),
                Text(" button below to add user in classroom"),
              ],
            ),
          ),
          Icon(Icons.arrow_downward_outlined ,size: 30,),
        ],
      ),
    ) ;;
  }
}
