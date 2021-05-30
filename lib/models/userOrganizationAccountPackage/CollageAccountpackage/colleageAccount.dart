import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/organization.dart';
import 'package:lms/models/userOrganizationAccountPackage/UserOrganizationAccount.dart';

abstract class CollageAccount extends UserOrganizationAccount {
  String memberName;

  //Constructor
  CollageAccount({String memberName, Orgnization orgnization, String role, String orgld}) : super(orgnization: orgnization, role: role, orgld: orgld) {
    this.memberName = memberName;
  }
}
