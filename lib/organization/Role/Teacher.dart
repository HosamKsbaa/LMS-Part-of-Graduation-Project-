import 'package:json_annotation/json_annotation.dart';

part 'Teacher.g.dart';

@JsonSerializable()
class Teacher {
  List<Course> courses;

  Teacher({this.courses});

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

}