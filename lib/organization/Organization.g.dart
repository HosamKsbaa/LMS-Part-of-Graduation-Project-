// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    name: json['name'] as String,
  )..collectionPath = json['path'] as String;
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) => <String, dynamic>{
      'path': instance.collectionPath,
      'name': instance.name,
    };
