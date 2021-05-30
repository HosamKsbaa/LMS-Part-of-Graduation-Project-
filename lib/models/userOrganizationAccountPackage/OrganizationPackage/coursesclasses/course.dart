import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/EmployeePackage/TeachingStuff.dart';
import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/StudentPackage/StudentCourseLog.dart';

class Course {
  String courseName;
  String courseData;

  //changed from  instant of Employee class to instant of Teachingstuff class
  TeachingStuff teachers;

  List<StudentCourseLog> Students;
}
