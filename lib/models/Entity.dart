import 'package:lms/models/Log.dart';

enum AccessLevel { can_read, can_write, can_delete, can_suggest_read, can_suggest_write }

abstract class Entity {
  String tagid;
  Map<String, List<AccessLevel>> userTag;
  List<Log> loglist;

  Entity({this.tagid, this.userTag, this.loglist});
}
