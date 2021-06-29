// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    json['entityId'] as String,
    coursesList: (json['coursesList'] as List<dynamic>)
        .map((e) => ClassRoom.fromJson(e as Map<String, dynamic>))
        .toList(),
    orgAccountType:
        _$enumDecode(_$OrgAccountTypeEnumMap, json['orgAccountType']),
    orgid: json['orgid'] as String,
    uid: json['uid'] as String,
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
  )..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'orgid': instance.orgid,
      'uid': instance.uid,
      'orgAccountType': _$OrgAccountTypeEnumMap[instance.orgAccountType],
      'coursesList': instance.coursesList,
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
