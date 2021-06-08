import 'Log.dart';

abstract class Entity {
  Entity({this.entityId, this.userUserAccess, this.logList});
  final String entityId;

  ///Map<UserID,List<AccesLevel>>
  final Map<String, List<AccessLevel>> userUserAccess;

  final List<Log> logList;
}

enum AccessLevel {
  Read, // R
  right, //w
  delete, //D
  suggestRight, //sr
  suggestDelete,
}
