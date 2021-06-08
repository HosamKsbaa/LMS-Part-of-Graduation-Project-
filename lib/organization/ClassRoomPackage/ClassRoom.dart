import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/Log.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/orgAccount/Role/Student.dart';
import 'package:lms/organization/orgAccount/Role/Teacher.dart';

part 'ClassRoom.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassRoom extends Entity {
  String courcedata;
  List<Teacher> teacher;
  List<Student> student;

  ClassRoom({this.courcedata, this.student, this.teacher, List<Log> log, String entityId, Map<String, List<AccessLevel>> userUserAccess}) : super(logList: log, entityId: entityId, userUserAccess: userUserAccess);

  factory ClassRoom.fromJson(Map<String, dynamic> json) => _$ClassRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassRoomToJson(this);
}
