// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Parent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parent _$ParentFromJson(Map<String, dynamic> json) {
  return Parent(
    json['entityId'] as String,
    orgAccountType:
        _$enumDecode(_$OrgAccountTypeEnumMap, json['orgAccountType']),
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
    orgid: json['orgid'] as String,
  )..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$ParentToJson(Parent instance) => <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'orgid': instance.orgid,
      'orgAccountType': _$OrgAccountTypeEnumMap[instance.orgAccountType],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$OrgAccountTypeEnumMap = {
  OrgAccountType.Administrator: 'Administrator',
  OrgAccountType.Owner: 'Owner',
  OrgAccountType.Parent: 'Parent',
  OrgAccountType.Student: 'Student',
  OrgAccountType.Teacher: 'Teacher',
};
