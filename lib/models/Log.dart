import 'package:json_annotation/json_annotation.dart';

part 'Log.g.dart';

@JsonSerializable()
class Log {
  String entity;
  String event;
  String orgAccount;

  Log({this.entity, this.event ,this.orgAccount});

  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);

  Map<String, dynamic> toJson() => _$LogToJson(this);

}