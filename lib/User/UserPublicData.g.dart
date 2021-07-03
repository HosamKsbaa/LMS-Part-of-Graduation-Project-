// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPublicData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPublicData _$UserPublicDataFromJson(Map<String, dynamic> json) {
  return UserPublicData(
    displayName: json['displayName'] as String,
    userProfilePic: json['userProfilePic'] as String,
    entityTyps: _$enumDecode(_$EntityTypsEnumMap, json['entityTyps']),
    FcmToken: json['FcmToken'] as String,
  )
    ..lastTimeEdited = DateTime.parse(json['lastTimeEdited'] as String)
    ..collectionPath = json['collectionPath'] as String
    ..doneSet = json['doneSet'] as bool;
}

Map<String, dynamic> _$UserPublicDataToJson(UserPublicData instance) =>
    <String, dynamic>{
      'entityTyps': _$EntityTypsEnumMap[instance.entityTyps],
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'doneSet': instance.doneSet,
      'displayName': instance.displayName,
      'userProfilePic': instance.userProfilePic,
      'FcmToken': instance.FcmToken,
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
