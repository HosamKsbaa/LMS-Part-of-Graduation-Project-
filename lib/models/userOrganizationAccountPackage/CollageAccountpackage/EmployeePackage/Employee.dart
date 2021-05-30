import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/colleageAccount.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/organization.dart';

abstract class Employee extends CollageAccount {
  DateTime employeeDate;

  //Constructor
  Employee({DateTime employeeDate, String memberName, Orgnization orgnization, String role, String orgld}) : super(orgld: orgld, role: role, orgnization: orgnization, memberName: memberName) {
    this.employeeDate = employeeDate;
  }
}
