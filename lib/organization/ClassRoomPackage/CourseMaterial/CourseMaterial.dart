import 'package:json_annotation/json_annotation.dart';
import 'package:lms/models/Entity.dart';
import 'package:lms/models/Log.dart';
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
    String tagid,
    Map<String, List<AccessLevel>> userTag,
  }) : super(loglist: log, tagid: tagid, userTag: userTag);

  void post_Anew_Block(CourseMaterialBlock course) {
    this.courSematerialblock.add(course);
  }

  factory CourseMaterial.fromJson(Map<String, dynamic> json) => _$CourseMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$CourseMaterialToJson(this);
}
