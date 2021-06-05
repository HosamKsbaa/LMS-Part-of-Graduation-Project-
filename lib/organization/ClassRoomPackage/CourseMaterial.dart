import 'package:json_annotation/json_annotation.dart';
import 'package:lms/models/Entity.dart';
import 'package:lms/models/Log.dart';
import 'package:lms/models/organization/ClassRoomPackage/HiddenDoc.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/CousreMaterialBlock.dart';

part 'CourseMaterial.g.dart';

@JsonSerializable(explicitToJson: true)

class CourseMaterial extends Entity {
  List<CourseMaterialBlock> coursematerialblock;
  // List<HiddenDoc> hidden_docs;

  CourseMaterial({
    this.coursematerialblock,
    this.hidden_docs,
    List<Log> log,
    String tagid,
    Map<String, List<AccessLevel>> userTag,
  }) : super(loglist: log, tagid: tagid, userTag: userTag);

  void post_Anew_Block(CourseMaterialBlock course) {
    this.coursematerialblock.add(course);
  }



  factory CourseMaterial.fromJson(Map<String, dynamic> json) =>
      _$CourseMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$CourseMaterialToJson(this);
}
