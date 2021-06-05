import 'package:json_annotation/json_annotation.dart';
import 'package:lms/models/Log.dart';

part 'Entity.g.dart';


enum AccessLevel {
  can_read,
  can_write,
  can_delete,
  can_suggest_read,
  can_suggest_write
}
@JsonSerializable(explicitToJson: true)

class Entity {
  String tagid;
  Map<String, List<AccessLevel>> userTag;
  List<Log> loglist;

  Entity({this.tagid, this.userTag, this.loglist});

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);

  Map<String, dynamic> toJson() => _$EntityToJson(this);
}
