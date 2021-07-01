import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lms/main.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:x_bloc2/x_bloc2.dart';

class SignUpInfoController {
//region  Keys
  static const List<HDMKey<SignUpInfoController>> _keyList = [key1];
  late HDMMain<SignUpInfoController> data;
  void _start() => data = HDMMain<SignUpInfoController>(this, (HDMBox<SignUpInfoController> box) => _WidgetSignUpInfo(this, box), _keyList);
  static const HDMKey<SignUpInfoController> key1 = HDMKey<SignUpInfoController>();

//endregion
  SignUpInfoController() {
    _start();
  }
  late String firstName;
  late String lastName;
  late String gender;
  late DateTime Birthday;
  late String PhoneNumber;
  late String email;
  late String displayName;

  final _formKey = GlobalKey<FormState>();
  Future<void> SignUpAnewUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      toast("proccsing");
      TheApp.appcntroler.SignUp(context: context, displayName: displayName, PhoneNumber: PhoneNumber, lastName: lastName, firstName: firstName, email: email, Birthday: Birthday, gender: gender);
    }
  }
}

class _WidgetSignUpInfo extends HDMStatelessWidget<SignUpInfoController> {
  _WidgetSignUpInfo(SignUpInfoController app, HDMBox<SignUpInfoController> box) : super(app, box);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .7,
            child: Form(
              key: app._formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CustomText(onSaved: (v) => app.displayName = v!, labelText: "displayName"),
                    CustomText(onSaved: (v) => app.firstName = v!, labelText: "firstName"),
                    CustomText(onSaved: (v) => app.lastName = v!, labelText: "lastName"),
                    CustomText(onSaved: (v) => app.PhoneNumber = v!, labelText: "PhoneNumber"),
                    CustomText(onSaved: (v) => app.email = v!, labelText: "email"),
                    DateTimeField(
                      format: DateFormat("yyyy-MM-dd"),
                      onShowPicker: (BuildContext context, DateTime? currentValue) async {
                        final date = await showDatePicker(context: context, firstDate: DateTime(1900), initialDate: currentValue ?? DateTime.now(), lastDate: DateTime.now());
                        if (date != null) {
                          final time = TimeOfDay.now();
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
                        labelText: 'Birthday',
                      ),
                      onSaved: (v) => app.Birthday = v!,
                    ),
                    CustomText(onSaved: (v) => app.gender = v!, labelText: "gender"),

                    ElevatedButton(
                      onPressed: () => app.SignUpAnewUser(context),
                      child: Text('Submit'),
                    ),
                    // Add TextFormFields and ElevatedButton here.
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.onSaved, required this.labelText, this.prefix}) : super(key: key);
  final String? labelText;
  final Widget? prefix;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onSaved: onSaved,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hoverColor: Colors.white,
          labelText: labelText,
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
