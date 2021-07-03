import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/main.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:x_bloc2/x_bloc2.dart';

class AddOrgInffoController {
//region  Keys
  static const List<HDMKey<AddOrgInffoController>> _keyList = [key1];
  late HDMMain<AddOrgInffoController> data;
  void _start() => data = HDMMain<AddOrgInffoController>(this, (HDMBox<AddOrgInffoController> box) => _WidgetAddOrgInffo(this, box), _keyList);
  static const HDMKey<AddOrgInffoController> key1 = HDMKey<AddOrgInffoController>();

//endregion
  late String orgName;
  final _formKey = GlobalKey<FormState>();

  AddOrgInffoController() {
    _start();
  }

  Future<void> CreatANewOrg(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      toast("proccsing");

      //  Appcntroler appcntroler = Appcntroler();
      var x = await TheApp.appcntroler.addOrgnization(user!.uid + DateTime.now().toString(), name: orgName);

      toast("Succes");
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      //var classroom = x.addClassroom("TestclassRoom1", classRoomName: "data science");
    }
  }
}

class _WidgetAddOrgInffo extends HDMStatelessWidget<AddOrgInffoController> {
  _WidgetAddOrgInffo(AddOrgInffoController app, HDMBox<AddOrgInffoController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .7,
            child: Form(
              key: app._formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (v) => app.orgName = v!,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                        hoverColor: Colors.white,
                        labelText: 'Org Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => app.CreatANewOrg(context),
                    child: Text('Submit'),
                  ),
                  // Add TextFormFields and ElevatedButton here.
                ],
              ),
            ),
          ),
        ));
  }
}
