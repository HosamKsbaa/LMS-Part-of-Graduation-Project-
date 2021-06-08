//region header
import 'package:json_annotation/json_annotation.dart';

part 'StudentAnsers.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class StudentAnsers {
  StudentAnsers();
  String questionFileID;
  String answer;

  //region jsonApi
  factory StudentAnsers.fromJson(Map<String, dynamic> json) => _$StudentAnsersFromJson(json);
  Map<String, dynamic> toJson() => _$StudentAnsersToJson(this);
  //endregion
}
