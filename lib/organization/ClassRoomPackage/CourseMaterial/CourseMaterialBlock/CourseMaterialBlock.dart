import 'Event/Event.dart';
import 'intractionBlock/ActivitySignetre.dart';

abstract class CourseMaterialBlock extends ActivitySignetre {
  CourseMaterialBlock(this.title, String userOrgnizationAccountId, DateTime postedAt, this.courseMaterialType) : super('', null);
  final String courseMaterialType;
  final String title;
  List<Importance> importance;

  //region jsonApi
  factory CourseMaterialBlock.fromJson(Map<String, dynamic> json) {
    if (json["courseMaterialType"] == "Event ")
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
