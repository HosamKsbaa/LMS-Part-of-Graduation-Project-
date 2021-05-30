import 'package:lms/models/userOrganizationAccountPackage/CollageAccountpackage/StudentPackage/CollageStudent.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/activitysignature.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/comment.dart';
import 'package:lms/models/userOrganizationAccountPackage/UserOrganizationAccount.dart';

abstract class CourseMaterialBlock extends ActivitySignature {
  String title;
  DateTime timeposted;
  Duration duration;
  int importance;
  CollageStudent studentNotified;

  //Constructor
  CourseMaterialBlock(String title, DateTime timeposted, Duration duration, int importance, CollageStudent studentNotified, UserOrganizationAccount postedBy, DateTime postedAt, UserOrganizationAccount seenby, Comment comment) : super(postedBy, postedAt, seenby, comment) {
    this.title = title;
    this.timeposted = timeposted;
    this.duration = duration;
    this.importance = importance;
    this.studentNotified = studentNotified;
  }
}
