import 'OrganizationPackage/organization.dart';

abstract class UserOrganizationAccount {
  Orgnization orgnization;
  String role;
  String orgld;

  //Constructor
  UserOrganizationAccount({Orgnization orgnization, String role, String orgld}) {
    this.orgnization = orgnization;
    this.role = role;
    this.orgld = orgld;
  }

  void contactOrsupport() {}
}
