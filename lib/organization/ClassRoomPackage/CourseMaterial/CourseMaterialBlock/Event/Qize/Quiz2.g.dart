// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Quiz2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return Quiz(
    json['entityId'] as String,
    title: json['title'] as String,
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
    eventType: _$enumDecode(_$LMSEventTypeEnumMap, json['eventType']),
    importance: (json['importance'] as List<dynamic>)
        .map((e) => _$enumDecode(_$ImportanceEnumMap, e))
        .toList(),
    entityTyps: _$enumDecode(_$EntityTypsEnumMap, json['entityTyps']),
    activitySignetreTyps: _$enumDecode(
        _$ActivitySignetreTypsEnumMap, json['activitySignetreTyps']),
    courseMaterialType:
        _$enumDecode(_$CourseMaterialTypeEnumMap, json['courseMaterialType']),
  )
    ..collectionPath = json['collectionPath'] as String
    ..doneSet = json['doneSet'] as bool;
}

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'entityTyps': _$EntityTypsEnumMap[instance.entityTyps],
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'doneSet': instance.doneSet,
      'activitySignetreTyps':
          _$ActivitySignetreTypsEnumMap[instance.activitySignetreTyps],
      'courseMaterialType':
          _$CourseMaterialTypeEnumMap[instance.courseMaterialType],
      'title': instance.title,
      'importance':
          instance.importance.map((e) => _$ImportanceEnumMap[e]).toList(),
      'eventType': _$LMSEventTypeEnumMap[instance.eventType],
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

const _$LMSEventTypeEnumMap = {
  LMSEventType.Quiz: 'Quiz',
};

const _$ImportanceEnumMap = {
  Importance.toAll: 'toAll',
  Importance.allstudents: 'allstudents',
};

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

const _$CourseMaterialTypeEnumMap = {
  CourseMaterialType.Event: 'Event',
  CourseMaterialType.Announecmtextends: 'Announecmtextends',
};
