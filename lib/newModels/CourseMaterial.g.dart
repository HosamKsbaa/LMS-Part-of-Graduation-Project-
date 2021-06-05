// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CourseMaterial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseMaterial _$CourseMaterialFromJson(Map<String, dynamic> json) {
  return CourseMaterial(
    json['entityId'] as String,
    (json['userUserAccess'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, (e as List)?.map((e) => _$enumDecodeNullable(_$AccessLevelEnumMap, e))?.toList()),
    ),
    (json['logList'] as List)?.map((e) => e == null ? null : Log.fromJson(e as Map<String, dynamic>))?.toList(),
  );
}

Map<String, dynamic> _$CourseMaterialToJson(CourseMaterial instance) => <String, dynamic>{
      'entityId': instance.entityId,
      'userUserAccess': instance.userUserAccess?.map((k, e) => MapEntry(k, e?.map((e) => _$AccessLevelEnumMap[e])?.toList())),
      'logList': instance.logList,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries.singleWhere((e) => e.value == source, orElse: () => null)?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AccessLevelEnumMap = {
  AccessLevel.Read: 'Read',
  AccessLevel.right: 'right',
  AccessLevel.delete: 'delete',
  AccessLevel.suggestRight: 'suggestRight',
  AccessLevel.suggestDelete: 'suggestDelete',
};
