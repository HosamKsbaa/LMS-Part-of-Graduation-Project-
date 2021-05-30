import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/EmployeePackage/Employee.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/PersonalHandler.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/corcesHandler.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/course.dart';

class Faculty {
  List<Course> facultyCourses;
  Employee dean;
  CourseHandler corcehandler;
  PersonalHandler personalhandler;

  //Constructor
  Faculty(List<Course> facultyCourses, Employee dean, CourseHandler corcehandler, PersonalHandler personalhandler) {
    this.facultyCourses = facultyCourses;
    this.dean = dean;
    this.corcehandler = corcehandler;
    this.personalhandler = personalhandler;
  }
}
