import 'Corces.dart';

class Person {
  String name;
  String id;
  DateTime birthDay;
  String gender;
}

class Student extends Person {
  List<Course> inListedCorces;
}

class Teacher extends Person {
  List<Course> myCorces;
}

class Parent extends Person {
  List<Student> children;
}
