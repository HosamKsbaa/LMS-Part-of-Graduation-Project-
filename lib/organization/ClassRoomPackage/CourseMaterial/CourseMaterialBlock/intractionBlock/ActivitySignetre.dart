//region header

import '../CourseMaterialBlock.dart';

abstract class ActivitySignetre {
  ActivitySignetre(this.userOrgnizationAccountId, this.postedAt, this.activitySignetreType);
  final String activitySignetreType;
  final String userOrgnizationAccountId;
  final DateTime postedAt;

  //region jsonApi
  factory ActivitySignetre.fromJson(Map<String, dynamic> json) {
    if (json["activitySignetreType"] == "CourseMaterialBlock")
      return CourseMaterialBlock.fromJson(json);
    // else if (json["activitySignetreType"] == "parent")
    //   return Parent.fromJson(json);
    //
    else
      throw {"this Shoud be implemented only at intractionBlock  n "};
  }
  Map<String, dynamic> toJson();
  //endregion
}
