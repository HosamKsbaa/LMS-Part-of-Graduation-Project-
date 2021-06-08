import '../CourseMaterialBlock.dart';

abstract class LMSEvent extends CourseMaterialBlock {
  LMSEvent(String title, String userOrgnizationAccountId, DateTime postedAt, this.eventType, {String courseMaterialType = "Event"}) : super('', '', null, '');
  final String eventType;
  //region jsonApi
  factory LMSEvent.fromJson(Map<String, dynamic> json) {
    //todo add quiz
    return null;
  }
  Map<String, dynamic> toJson();
  //endregion
}
