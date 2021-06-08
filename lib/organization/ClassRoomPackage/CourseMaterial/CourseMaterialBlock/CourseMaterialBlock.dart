import 'Event/Event.dart';
import 'intractionBlock/ActivitySignetre.dart';

abstract class CourseMaterialBlock extends ActivitySignetre {
  CourseMaterialBlock(this.title, String userOrgnizationAccountId, DateTime postedAt, this.courseMaterialType, this.importance, {String activitySignetreType = "CourseMaterialBlock"}) : super(userOrgnizationAccountId, postedAt, activitySignetreType);
  final String courseMaterialType;
  final String title;
  final List<Importance> importance;

  //region jsonApi
  factory CourseMaterialBlock.fromJson(Map<String, dynamic> json) {
    if (json["courseMaterialType"] == "LMSEvent ")
      return LMSEvent.fromJson(json);
    else
      throw {"Error undefined OrgAccount type"};
  }
  Map<String, dynamic> toJson();
  //endregion
}

enum Importance {
  toAll,
  allstudents,
}
