import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lms/organization/ClassRoomPackage/ClassRoom.dart';
import 'package:lms/organization/ClassRoomPackage/CourseMaterial/CourseMaterialBlock/Event/Qize/QizeQuestionFile/Qestion.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:x_bloc2/x_bloc2.dart';

import 'AddQestions.dart';

class CreatAQizeController {
//region  Keys
  static const List<HDMKey<CreatAQizeController>> _keyList = [key1];
  late HDMMain<CreatAQizeController> data;
  void _start() => data = HDMMain<CreatAQizeController>(this, (HDMBox<CreatAQizeController> box) => _WidgetCreatAQize(this, box), _keyList);
  static const HDMKey<CreatAQizeController> key1 = HDMKey<CreatAQizeController>();

//endregion
  late String name;
  late String mark;
  late DateTime startdate;
  late DateTime enddate;
  final ClassRoom classRoom;
  late String instructions;

  final Map<String, Qestion> qestionMap = {};
  List<int> x = [1];

  //late Duration duration;
  //late String instrectuions;
  void nextPage() {
    x.add(x.length + 1);
    data.updateTheWholeApp();
    pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  Future<void> SignUpAnewUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      nextPage();
      toast("done , swipe >> to add more qestions");
      //TheApp.appcntroler.SignUp(context: context, displayName: displayName, PhoneNumber: PhoneNumber, lastName: lastName, firstName: firstName, email: email, Birthday: Birthday, gender: gender);
    }
  }

  Future<void> PuplishTheqize(BuildContext context) async {
    print(qestionMap);
    print(startdate);

    print(enddate);

    print(enddate.difference(enddate));

    print(mark);

    print(instructions);

    var x = await classRoom.addaQize(title: name);
    x.addAnQestionFile(
      qestionMap: qestionMap,
      startDate: startdate,
      endDate: enddate,
      allwedDuration: enddate.difference(startdate),
      marks: mark,
      posiibleAttimpts: "1",
      quizMainPage: "",
      instructions: instructions,
    );
  }

  PageController pageController = PageController();

  final _formKey = GlobalKey<FormState>();
  CreatAQizeController({required this.classRoom}) {
    _start();
  }
}

class _WidgetCreatAQize extends HDMStatelessWidget<CreatAQizeController> {
  _WidgetCreatAQize(CreatAQizeController app, HDMBox<CreatAQizeController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          app.PuplishTheqize(context);
        },
        child: Icon(Icons.done, color: Colors.white),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.info_outline),
            ),
            Padding(padding: EdgeInsets.only(right: 5), child: Text("Insert your Exam data"))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .9,
          child: PageView(
            physics: new NeverScrollableScrollPhysics(),
            controller: app.pageController,
            children: <Widget>[
                  Center(
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 35),
                          child: Container(
                            //     width: MediaQuery.of(context).size.width * .7,
                            child: Form(
                              key: app._formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    CustomText(
                                      onSaved: (v) => v != null ? app.name = v : app.name = app.name,
                                      labelText: "Name ",
                                      icon: Icon(
                                        Icons.title,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    CustomText(
                                        onSaved: (v) => v != null ? app.mark = v : app.mark = app.mark,
                                        labelText: "Marks",
                                        icon: Icon(
                                          Icons.grading_sharp,
                                          color: Colors.blueAccent,
                                        )),

                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: DateTimeField(
                                        format: DateFormat("yyyy-MM-dd HH:mm"),
                                        onShowPicker: (BuildContext context, DateTime? currentValue) async {
                                          final date = await showDatePicker(context: context, firstDate: DateTime(1900), initialDate: currentValue ?? DateTime.now(), lastDate: DateTime.now());
                                          if (date != null) {
                                            final time = await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                            );
                                            return DateTimeField.combine(date, time);
                                          } else {
                                            return currentValue;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                          hoverColor: Colors.white,
                                          labelText: 'Exam starts at',
                                          icon: Icon(
                                            Icons.not_started_outlined,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        onSaved: (v) => v != null ? app.startdate = v : null,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: DateTimeField(
                                        format: DateFormat("yyyy-MM-dd HH:mm"),
                                        onShowPicker: (BuildContext context, DateTime? currentValue) async {
                                          final date = await showDatePicker(context: context, firstDate: DateTime(1900), initialDate: currentValue ?? DateTime.now(), lastDate: DateTime.now());
                                          if (date != null) {
                                            final time = await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                            );
                                            return DateTimeField.combine(date, time);
                                          } else {
                                            return currentValue;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                          hoverColor: Colors.white,
                                          labelText: 'Exam Ends at',
                                          icon: Icon(
                                            Icons.pause,
                                            color: Colors.blueAccent,
                                          ),
                                        ),
                                        onSaved: (v) => v != null ? app.enddate = v : null,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        onSaved: (v) => v != null ? app.instructions = v : null,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                                          hoverColor: Colors.white,
                                          labelText: "instructions",
                                          icon: Icon(
                                            Icons.integration_instructions,
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
                                    ),
                                    ElevatedButton(
                                      onPressed: () => app.SignUpAnewUser(context),
                                      child: Text('next'),
                                    ),
                                    // Add TextFormFields and ElevatedButton here
                                  ],
                                ),
                              ),
                            ),
                          )))
                ] +
                app.x.map((e) => AddQestionsController(tkey: e.toString(), app: app).data.play()).toList(),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.onSaved, required this.labelText, this.icon}) : super(key: key);
  final String? labelText;
  final Icon? icon;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onSaved: onSaved,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hoverColor: Colors.white,
          labelText: labelText,
          icon: icon,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
