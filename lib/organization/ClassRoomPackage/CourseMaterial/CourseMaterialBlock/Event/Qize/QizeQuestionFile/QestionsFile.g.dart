// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QestionsFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QestionsFile _$QestionsFileFromJson(Map<String, dynamic> json) {
  return QestionsFile(
    json['entityId'] as String,
    qestionMap: (json['qestionMap'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, Qestion.fromJson(e as Map<String, dynamic>)),
    ),
    startDate: DateTime.parse(json['startDate'] as String),
    endDate: DateTime.parse(json['endDate'] as String),
    allwedDuration: Duration(microseconds: json['allwedDuration'] as int),
    marks: json['marks'] as String,
    posiibleAttimpts: json['posiibleAttimpts'] as String,
    instructions: json['instructions'] as String,
    lastTimeEdited: DateTime.parse(json['lastTimeEdited'] as String),
    hiddenType: _$enumDecode(_$HiddenTypeEnumMap, json['hiddenType']),
  )
    ..collectionPath = json['collectionPath'] as String
    ..doneSet = json['doneSet'] as bool;
}

Map<String, dynamic> _$QestionsFileToJson(QestionsFile instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'entityId': instance.entityId,
      'doneSet': instance.doneSet,
      'hiddenType': _$HiddenTypeEnumMap[instance.hiddenType],
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'allwedDuration': instance.allwedDuration.inMicroseconds,
      'marks': instance.marks,
      'posiibleAttimpts': instance.posiibleAttimpts,
      'instructions': instance.instructions,
      'qestionMap': instance.qestionMap.map((k, e) => MapEntry(k, e.toJson())),
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

const _$HiddenTypeEnumMap = {
  HiddenType.AnserFile: 'AnserFile',
  HiddenType.qestionFile: 'qestionFile',
};
