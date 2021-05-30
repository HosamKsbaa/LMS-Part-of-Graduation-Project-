import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/StudentPackage/CollageStudent.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/CousreMaterialBlock.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/comment.dart';
import 'package:lms/models/userOrganizationAccountPackage/UserOrganizationAccount.dart';

class Form extends CourseMaterialBlock {
  //Constructor
  Form(String title, DateTime timeposted, Duration duration, int importance, CollageStudent studentNotified, UserOrganizationAccount postedBy, DateTime postedAt, UserOrganizationAccount seenby, Comment comment)
      : super(title, timeposted, duration, importance, studentNotified, postedBy, postedAt, seenby, comment) {}
}
