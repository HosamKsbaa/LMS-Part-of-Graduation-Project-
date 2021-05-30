import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/comment.dart';
import 'package:lms/models/userOrganizationAccountPackage/UserOrganizationAccount.dart';

abstract class ActivitySignature {
  UserOrganizationAccount postedBy;
  DateTime postedAt;
  UserOrganizationAccount seenby;
  Comment comment;

  ActivitySignature(UserOrganizationAccount postedBy, DateTime postedAt, UserOrganizationAccount seenby, Comment comment) {
    this.postedAt = postedAt;
    this.postedBy = postedBy;
    this.comment = comment;
  }

  void edit() {}
  void delete() {}
  void commit(String text) {
    this.comment.body = text;
  }
}
