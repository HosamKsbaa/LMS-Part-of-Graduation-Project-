import 'package:flutter/material.dart';
import 'package:lms/organization/orgAccount/OrgUser.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:x_bloc2/x_bloc2.dart';

import '../../../../main.dart';

class AddAnAccountController {
//region  Keys
  static const List<HDMKey<AddAnAccountController>> _keyList = [key1];
  late HDMMain<AddAnAccountController> data;
  void _start() => data = HDMMain<AddAnAccountController>(this, (HDMBox<AddAnAccountController> box) => _WidgetAddAnAccount(this, box), _keyList);
  static const HDMKey<AddAnAccountController> key1 = HDMKey<AddAnAccountController>();

//endregion
  late String Code;
  final _formKey = GlobalKey<FormState>();
  AddAnAccountController() {
    _start();
  }

  Future<void> connectToAccoun(BuildContext context) async {
    // final FirebaseAuth auth = FirebaseAuth.instance;
    // final User? user = auth.currentUser;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      toast("proccsing");

      //  Appcntroler appcntroler = Appcntroler();

      var org = await TheApp.appcntroler.org.getValOnline(OrgUser.getOrgId(Code));
      print("???????" + org.toString());

      if (org != null) {
        OrgUser? orgUser = await org.orgUser.getValOnline(OrgUser.getOrgUserId(Code));

        if (orgUser != null) {
          var orgPointer = await TheApp.appcntroler.usedrPriviteDate!.addAnOrganizationPinter(org: org, orgUserCode: Code);
          org.orgUser.updateValue(orgUser);
          toast("Succes");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          return;
        } else {
          toast("the UserOrg Code is Not Correct ${OrgUser.getOrgUserId(Code)} ");
        }
      } else {
        toast("the org Code is Not Correct ${OrgUser.getOrgId(Code)}");
      }

      //var classroom = x.addClassroom("TestclassRoom1", classRoomName: "data science");
    }
  }
}

class _WidgetAddAnAccount extends HDMStatelessWidget<AddAnAccountController> {
  _WidgetAddAnAccount(AddAnAccountController app, HDMBox<AddAnAccountController> box) : super(app, box);

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
                      maxLines: 10,
                      onSaved: (v) => app.Code = v!,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                        hoverColor: Colors.white,
                        labelText: 'Ur Code ',
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
                    onPressed: () => app.connectToAccoun(context),
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
