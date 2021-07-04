import 'package:flutter/material.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/Qestion.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/QestionsTypes/MCQ.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:x_bloc2/x_bloc2.dart';

import 'CreatAQizePage.dart';

class AddQestionsController {
//region  Keys
  static const List<HDMKey<AddQestionsController>> _keyList = [key1];
  late HDMMain<AddQestionsController> data;
  void _start() => data = HDMMain<AddQestionsController>(this, (HDMBox<AddQestionsController> box) => _WidgetAddQestions(this, box), _keyList);
  static const HDMKey<AddQestionsController> key1 = HDMKey<AddQestionsController>();

//endregion
  AddQestionsController({required this.tkey, required this.app}) {
    _start();
  }
  final _formKey = GlobalKey<FormState>();

  final String tkey;
  final CreatAQizeController app;
  late String qestionHead;
  late String qestion1Correct;
  late String qestion1;
  late String qestion2;
  late String qestion3;
  bool submitted = false;
  void addAqustionfunc() {
    if (_formKey.currentState!.validate()) {
      toast("Processing");

      _formKey.currentState!.save();
      app.qestionMap[tkey] = MCQ(qestionType: QestionType.MCQ, seen: false, qestionid: tkey, qestionHead: qestionHead, ansers: {"C1": qestion1Correct, "W1": qestion1, "W2": qestion2, "W3": qestion3});

      toast("done");

      submitted = true;
      app.nextPage();
      print(app.qestionMap);
      print(app.name);
      //TheApp.appcntroler.SignUp(context: context, displayName: displayName, PhoneNumber: PhoneNumber, lastName: lastName, firstName: firstName, email: email, Birthday: Birthday, gender: gender);
    }
  }
}

class _WidgetAddQestions extends HDMStatelessWidget<AddQestionsController> {
  _WidgetAddQestions(AddQestionsController app, HDMBox<AddQestionsController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: EdgeInsets.only(bottom: 40),
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Question ${app.tkey}", style: TextStyle(fontSize: 25, color: Colors.black)),
            ),
            Form(
              key: app._formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Divider(),
                    TextFormField(
                      onSaved: (v) => app.qestionHead = v!,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                        hoverColor: Colors.white,
                        labelText: "Qestion Headd",
                        icon: Icon(
                          Icons.title,
                          color: Colors.blueAccent,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Divider(),
                    CustomText(onSaved: (v) => app.qestion1Correct = v!, labelText: "correct anser", icon: Icon(Icons.done, color: Colors.green)),
                    CustomText(
                      onSaved: (v) => app.qestion1 = v!,
                      labelText: "wrong ans 1 ",
                      icon: Icon(
                        Icons.backspace_outlined,
                        color: Colors.red,
                      ),
                    ),

                    CustomText(
                      onSaved: (v) => app.qestion2 = v!,
                      labelText: "wrong ans 2",
                      icon: Icon(
                        Icons.backspace_outlined,
                        color: Colors.red,
                      ),
                    ),
                    CustomText(
                      onSaved: (v) => app.qestion3 = v!,
                      labelText: "wrong ans 3",
                      icon: Icon(
                        Icons.backspace_outlined,
                        color: Colors.red,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () => app.addAqustionfunc(),
                      child: app.submitted == false ? Text('save') : Text('edite'),
                    ),
                    // Add TextFormFields and ElevatedButton here
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    ]);
  }
}
