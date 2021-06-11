// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    json['entityId'] as String,
    name: json['name'] as String,
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
  )..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'name': instance.name,
    };
