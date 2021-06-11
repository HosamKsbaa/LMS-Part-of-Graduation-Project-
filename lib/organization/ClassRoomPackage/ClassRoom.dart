import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';
import 'package:lms/organization/GeneralModels/HiddenFile/Hidden.dart';
import 'package:lms/organization/orgAccount/OrgAccount.dart';

import 'CourseMaterial/CourseMaterialBlock/CourseMaterialBlock.dart';

part 'ClassRoom.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassRoom extends ActivitySignetre {
  late String classRoomName;
  @JsonKey(ignore: true)
  late HDMCollection<OrgAccount> personal;
  @JsonKey(ignore: true)
  late HDMCollection<Hidden> hiddenDocs;
  @JsonKey(ignore: true)
  late HDMCollection<CourseMaterialBlock> courseMaterial;

  ClassRoom({required this.classRoomName, required String entityId, required DateTime lastTimeEdited}) : super(entityId, lastTimeEdited: lastTimeEdited) {
    personal = HDMCollection<OrgAccount>(this, "personal");
    hiddenDocs = HDMCollection<Hidden>(this, "hiddenDocs");
    courseMaterial = HDMCollection<CourseMaterialBlock>(this, "courseMaterial");
  }

  factory ClassRoom.fromJson(Map<String, dynamic> json) => _$ClassRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ClassRoomToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
}
