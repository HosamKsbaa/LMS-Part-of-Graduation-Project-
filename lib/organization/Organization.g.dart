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
    tagid: json['tagid'] as String,
    userTag: (json['userTag'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => _$enumDecodeNullable(_$AccessLevelEnumMap, e))
              ?.toList()),
    ),
  )..loglist = (json['loglist'] as List)
      ?.map((e) => e == null ? null : Log.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$OrganizationToJson(Organization instance) =>
    <String, dynamic>{
      'tagid': instance.tagid,
      'userTag': instance.userTag?.map((k, e) =>
          MapEntry(k, e?.map((e) => _$AccessLevelEnumMap[e])?.toList())),
      'loglist': instance.loglist?.map((e) => e?.toJson())?.toList(),
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
  AccessLevel.can_read: 'can_read',
  AccessLevel.can_write: 'can_write',
  AccessLevel.can_delete: 'can_delete',
  AccessLevel.can_suggest_read: 'can_suggest_read',
  AccessLevel.can_suggest_write: 'can_suggest_write',
};
