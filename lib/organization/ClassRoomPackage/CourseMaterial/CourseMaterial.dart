import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/Log.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';

import 'CourseMaterialBlock/CourseMaterialBlock.dart';

part 'CourseMaterial.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseMaterial extends Entity {
  List<CourseMaterialBlock> courSematerialblock;
  List<Hidden> hiddenDocs;

  CourseMaterial({
    this.courSematerialblock,
    this.hiddenDocs,
    List<Log> log,
    String entityId,
    Map<String, List<AccessLevel>> userUserAccess,
  }) : super(logList: log, entityId: entityId, userUserAccess: userUserAccess);

  void post_Anew_Block(CourseMaterialBlock course) {
    this.courSematerialblock.add(course);
  }

  factory CourseMaterial.fromJson(Map<String, dynamic> json) => _$CourseMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$CourseMaterialToJson(this);
}
