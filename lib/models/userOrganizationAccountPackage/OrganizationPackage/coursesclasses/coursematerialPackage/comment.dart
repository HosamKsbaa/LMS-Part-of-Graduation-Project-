import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/activitysignature.dart';
import 'package:lms/models/userOrganizationAccountPackage/UserOrganizationAccount.dart';

class Comment extends ActivitySignature {
  String body;
  int upvotetotal;

  //Constructor
  Comment(String body, int upvotetotal, UserOrganizationAccount postedBy, DateTime postedAt, UserOrganizationAccount seenby, Comment comment) : super(postedBy, postedAt, seenby, comment) {
    this.body = body;
    this.upvotetotal = upvotetotal;
  }

  void upvote() {
    //should be one for each account
    this.upvotetotal++;
  }
}
