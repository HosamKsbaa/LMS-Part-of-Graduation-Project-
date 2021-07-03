// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserPriviteDate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPriviteDate _$UserPriviteDateFromJson(Map<String, dynamic> json) {
  return UserPriviteDate(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    gender: json['gender'] as String,
    Birthday: DateTime.parse(json['Birthday'] as String),
    PhoneNumber: json['PhoneNumber'] as String,
    email: json['email'] as String,
    entityTyps: _$enumDecode(_$EntityTypsEnumMap, json['entityTyps']),
  )
    ..lastTimeEdited = DateTime.parse(json['lastTimeEdited'] as String)
    ..collectionPath = json['collectionPath'] as String
    ..doneSet = json['doneSet'] as bool;
}

Map<String, dynamic> _$UserPriviteDateToJson(UserPriviteDate instance) =>
    <String, dynamic>{
      'entityTyps': _$EntityTypsEnumMap[instance.entityTyps],
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'doneSet': instance.doneSet,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'Birthday': instance.Birthday.toIso8601String(),
      'PhoneNumber': instance.PhoneNumber,
      'email': instance.email,
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
