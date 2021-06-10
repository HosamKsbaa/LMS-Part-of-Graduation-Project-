// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Administrator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Administrator _$AdministratorFromJson(Map<String, dynamic> json) {
  return Administrator(
    orgid: json['orgid'] as String,
  )..collectionPath = json['path'] as String;
}

Map<String, dynamic> _$AdministratorToJson(Administrator instance) => <String, dynamic>{
      'path': instance.collectionPath,
      'orgid': instance.orgid,
    };
