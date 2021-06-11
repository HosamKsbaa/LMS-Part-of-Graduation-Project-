// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Appcntroler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appcntroler _$AppcntrolerFromJson(Map<String, dynamic> json) {
  return Appcntroler()
    ..lastTimeEdited = DateTime.parse(json['lastTimeEdited'] as String)
    ..collectionPath = json['collectionPath'] as String;
}

Map<String, dynamic> _$AppcntrolerToJson(Appcntroler instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
    };
