// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrgUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrgUser _$OrgUserFromJson(Map<String, dynamic> json) {
  return OrgUser(
    json['entityId'] as String,
    displayName: json['displayName'] as String?,
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
    entityTyps: _$enumDecode(_$EntityTypsEnumMap, json['entityTyps']),
    activitySignetreTyps: _$enumDecode(
        _$ActivitySignetreTypsEnumMap, json['activitySignetreTyps']),
  )
    ..collectionPath = json['collectionPath'] as String
    ..doneSet = json['doneSet'] as bool;
}

Map<String, dynamic> _$OrgUserToJson(OrgUser instance) => <String, dynamic>{
      'entityTyps': _$EntityTypsEnumMap[instance.entityTyps],
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'doneSet': instance.doneSet,
      'activitySignetreTyps':
          _$ActivitySignetreTypsEnumMap[instance.activitySignetreTyps],
      'displayName': instance.displayName,
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

const _$EntityTypsEnumMap = {
  EntityTyps.Organization: 'Organization',
  EntityTyps.ActivitySignetre: 'ActivitySignetre',
  EntityTyps.AccesLevel: 'AccesLevel',
  EntityTyps.Log: 'Log',
  EntityTyps.Hidden: 'Hidden',
  EntityTyps.Pointer: 'Pointer',
  EntityTyps.RootEntity: 'RootEntity',
  EntityTyps.UserPriviteDate: 'UserPriviteDate',
  EntityTyps.UserPublicData: 'UserPublicData',
};

const _$ActivitySignetreTypsEnumMap = {
  ActivitySignetreTyps.OrgAccount: 'OrgAccount',
  ActivitySignetreTyps.Quiz: 'Quiz',
  ActivitySignetreTyps.ClassRoom: 'ClassRoom',
  ActivitySignetreTyps.LmsEvent: 'LmsEvent',
  ActivitySignetreTyps.CourseMaterialBlock: 'CourseMaterialBlock',
  ActivitySignetreTyps.OrgUser: 'OrgUser',
};
