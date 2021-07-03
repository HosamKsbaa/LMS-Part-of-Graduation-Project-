// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassRoomPointer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassRoomPointer _$ClassRoomPointerFromJson(Map<String, dynamic> json) {
  return ClassRoomPointer(
    json['entityId'] as String,
    pointerPath: json['pointerPath'] as String,
    pointerId: json['pointerId'] as String,
    entityTyps: _$enumDecode(_$EntityTypsEnumMap, json['entityTyps']),
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
    pointerTypes: _$enumDecode(_$HDMPointerTypesEnumMap, json['pointerTypes']),
  )
    ..collectionPath = json['collectionPath'] as String
    ..doneSet = json['doneSet'] as bool;
}

Map<String, dynamic> _$ClassRoomPointerToJson(ClassRoomPointer instance) =>
    <String, dynamic>{
      'entityTyps': _$EntityTypsEnumMap[instance.entityTyps],
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'doneSet': instance.doneSet,
      'pointerPath': instance.pointerPath,
      'pointerId': instance.pointerId,
      'pointerTypes': _$HDMPointerTypesEnumMap[instance.pointerTypes],
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

const _$HDMPointerTypesEnumMap = {
  HDMPointerTypes.OrgAccountPointer: 'OrgAccountPointer',
  HDMPointerTypes.OrgnizationPointer: 'OrgnizationPointer',
  HDMPointerTypes.ClassRoomPointer: 'ClassRoomPointer',
};
