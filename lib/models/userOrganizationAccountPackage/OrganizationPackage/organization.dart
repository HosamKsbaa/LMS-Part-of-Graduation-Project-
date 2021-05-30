import '../UserOrganizationAccount.dart';

abstract class Orgnization {
  List<UserOrganizationAccount> personal;

  //Constructor
  Orgnization(List<UserOrganizationAccount> personal){
    this.personal =personal;
  }

}