// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Organization _$OrganizationFromJson(Map<String, dynamic> json) {
  return Organization(
    classroom: (json['classroom'] as List)
        ?.map((e) =>
            e == null ? null : ClassRoom.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    org: json['org'] == null
        ? null
        : Organization.fromJson(json['org'] as Map<String, dynamic>),
    Orgid: json['Orgid'] as String,
    Personal: (json['Personal'] as List)
        ?.map((e) =>
            e == null ? null : OrgAccount.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    entityId: json['entityId'] as String,
    userUserAccess: (json['userUserAccess'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => _$enumDecodeNullable(_$AccessLevelEnumMap, e))
              ?.toList()),
    ),
  );
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'entityId': instance.entityId,
      'userUserAccess': instance.userUserAccess?.map((k, e) =>
          MapEntry(k, e?.map((e) => _$AccessLevelEnumMap[e])?.toList())),
      'org': instance.org?.toJson(),
      'Orgid': instance.Orgid,
      'Personal': instance.Personal?.map((e) => e?.toJson())?.toList(),
      'classroom': instance.classroom?.map((e) => e?.toJson())?.toList(),
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

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

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
