// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassRoom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassRoom _$ClassRoomFromJson(Map<String, dynamic> json) {
  return ClassRoom(
    courcedata: json['courcedata'] as String,
    student: (json['student'] as List)
        ?.map((e) =>
            e == null ? null : Teacher.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    teacher: (json['teacher'] as List)
        ?.map((e) =>
            e == null ? null : Teacher.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$ClassRoomToJson(ClassRoom instance) => <String, dynamic>{
      'tagid': instance.tagid,
      'userTag': instance.userTag?.map((k, e) =>
          MapEntry(k, e?.map((e) => _$AccessLevelEnumMap[e])?.toList())),
      'loglist': instance.loglist?.map((e) => e?.toJson())?.toList(),
      'courcedata': instance.courcedata,
      'teacher': instance.teacher?.map((e) => e?.toJson())?.toList(),
      'student': instance.student?.map((e) => e?.toJson())?.toList(),
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
