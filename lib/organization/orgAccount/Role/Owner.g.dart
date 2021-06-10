// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    orgid: json['orgid'] as String,
  )..path = json['path'] as String;
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'path': instance.path,
      'orgid': instance.orgid,
    };
