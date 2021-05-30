import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/course.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/faculty.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/organization.dart';

import './Employee.dart';

class TeachingStuff extends Employee {
  Faculty faculty;
  List<Course> courses;

  TeachingStuff({Faculty faculty, List<Course> courses, DateTime employeeDate, String memberName, Orgnization orgnization, String role, String orgld}) : super(employeeDate: employeeDate, memberName: memberName, orgld: orgld, role: role, orgnization: orgnization) {
    this.faculty = faculty;
    this.courses = courses;
  }
}
