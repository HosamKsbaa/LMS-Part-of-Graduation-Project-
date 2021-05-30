import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/StudentPackage/StudentCourseLog.dart';
import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/colleageAccount.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/faculty.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/organization.dart';

class CollageStudent extends CollageAccount {
  List<StudentCourseLog> finishedCourses;
  double gpa;
  double creditHours;
  Faculty faculty;

  //Constructor
  CollageStudent({double gpa, double credith, Faculty f, List<StudentCourseLog> fc, String memberName, Orgnization orgnization, String role, String orgld}) : super(orgld: orgld, role: role, orgnization: orgnization, memberName: memberName) {
    this.gpa = gpa;
    this.creditHours = credith;
    this.faculty = f;
    finishedCourses = fc;
  }
}
