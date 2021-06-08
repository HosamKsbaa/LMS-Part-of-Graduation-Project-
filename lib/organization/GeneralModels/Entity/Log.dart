//region header
import 'package:json_annotation/json_annotation.dart';

part 'Log.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build --delete-conflicting-outputs
//endregion
class Log {
  String orgAccountId;
  String entityId;
  Map event;
  Log();
  //region jsonApi
  factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
  Map<String, dynamic> toJson() => _$LogToJson(this);
  //endregion
}
