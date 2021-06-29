// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orgnizationAccountControler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appcntroler _$AppcntrolerFromJson(Map<String, dynamic> json) {
  return Appcntroler()
    ..lastTimeEdited = DateTime.parse(json['lastTimeEdited'] as String)
    ..collectionPath = json['collectionPath'] as String
    ..userUid = json['userUid'] as String
    ..usedrPriviteDate = UserPriviteDate.fromJson(
        json['usedrPriviteDate'] as Map<String, dynamic>)
    ..userPublicData =
        UserPublicData.fromJson(json['userPublicData'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AppcntrolerToJson(Appcntroler instance) =>
    <String, dynamic>{
      'lastTimeEdited': instance.lastTimeEdited.toIso8601String(),
      'collectionPath': instance.collectionPath,
      'userUid': instance.userUid,
      'usedrPriviteDate': instance.usedrPriviteDate,
      'userPublicData': instance.userPublicData,
    };
