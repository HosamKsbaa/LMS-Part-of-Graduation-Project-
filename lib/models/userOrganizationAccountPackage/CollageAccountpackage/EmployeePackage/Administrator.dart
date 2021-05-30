import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/PersonalHandler.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/corcesHandler.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/organization.dart';

import './Employee.dart';

class Administrator extends Employee {
  CourseHandler courseHandler;
  PersonalHandler personalHandler;
  //Constructor
  Administrator({CourseHandler courseHandler, PersonalHandler personalHandler, DateTime employeeDate, String memberName, Orgnization orgnization, String role, String orgld}) : super(employeeDate: employeeDate, memberName: memberName, orgld: orgld, role: role, orgnization: orgnization) {
    this.courseHandler = courseHandler;
    this.personalHandler = personalHandler;
  }
}
