//region header

import 'package:json_annotation/json_annotation.dart';
import 'package:lms/organization/GeneralModels/Entity/Activity/ActivitySignetre.dart';
import 'package:lms/organization/GeneralModels/Entity/entity.dart';

import '../CourseMaterialBlock.dart';

part 'Announecmt.g.dart';

@JsonSerializable()

//flutter packages pub run build_runner build
//endregion
class Announecmtextends extends CourseMaterialBlock {
  Announecmtextends(String entityId, {required this.text, required String title, required DateTime lastTimeEdited, required List<Importance> importance, required EntityTyps entityTyps, required ActivitySignetreTyps activitySignetreTyps, required CourseMaterialType courseMaterialType})
      : super(
          entityId,
          lastTimeEdited: lastTimeEdited,
          courseMaterialType: courseMaterialType,
          importance: importance,
          title: title,
          entityTyps: entityTyps,
          activitySignetreTyps: activitySignetreTyps,
        );
  final String text;

  //region jsonApi
  factory Announecmtextends.fromJson(Map<String, dynamic> json) => _$AnnounecmtextendsFromJson(json);
  Map<String, dynamic> toJson() => _$AnnounecmtextendsToJson(this);
  //endregion
}
