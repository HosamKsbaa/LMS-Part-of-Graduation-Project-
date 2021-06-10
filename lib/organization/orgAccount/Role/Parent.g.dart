// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    orgid: json['orgid'] as String,
  )..path = json['path'] as String;
}

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'path': instance.path,
      'orgid': instance.orgid,
    };
