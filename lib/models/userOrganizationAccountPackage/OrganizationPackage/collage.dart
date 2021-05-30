import 'package:lms/models/userOrganizationAccountPackage/UserOrganizationAccount.dart';

import './faculty.dart';
import 'organization.dart';

class Collage extends Orgnization {
  List<Faculty> faculties;

  //Constructor
  Collage(List<Faculty> faculties, List<UserOrganizationAccount> personal) : super(personal) {
    this.faculties = faculties;
  }
}
