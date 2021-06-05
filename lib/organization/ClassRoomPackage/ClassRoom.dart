import 'package:json_annotation/json_annotation.dart';
import 'package:lms/models/Entity.dart';
import 'package:lms/models/Log.dart';
import 'package:lms/organization/Role/Teacher.dart';

part 'ClassRoom.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassRoom extends Entity {
  String courcedata;
  List<Teacher> teacher;
  List<Teacher> student;

  ClassRoom({this.courcedata, this.student, this.teacher, List<Log> log, String tagid, Map<String, List<AccessLevel>> userTag}) : super(loglist: log, tagid: tagid, userTag: userTag);

  factory ClassRoom.fromJson(Map<String, dynamic> json) => _$ClassRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassRoomToJson(this);
}
