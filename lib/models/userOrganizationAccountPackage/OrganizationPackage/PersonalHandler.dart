import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/EmployeePackage/Employee.dart';
import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/StudentPackage/CollageStudent.dart';

class PersonalHandler {
  List<CollageStudent> students;
  List<Employee> currentEmployee;

  void addStudent(CollageStudent student) {
    students.add(student);
  }

  void kcikStudent(CollageStudent student) {
    //not the best but it work for now
    students.removeAt(students.indexWhere((element) => element.memberName == student.memberName));
  }

  void enrollStudent() {}

  void kickTeacher() {}
}
