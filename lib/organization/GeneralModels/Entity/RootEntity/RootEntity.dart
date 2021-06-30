import '../../../orgnizationAccountControler.dart';
import '../entity.dart';

enum RootEntityTyps {
  Appcntroler,
}

abstract class RootEntity extends Entity {
  RootEntity(String entityId, {required this.rootEntityTyps}) : super(entityId, entityTyps: EntityTyps.RootEntity, lastTimeEdited: DateTime.now());

  final RootEntityTyps rootEntityTyps;

  Map<String, dynamic> toJson();
  factory RootEntity.fromJson(Map<String, dynamic> json) {
    switch (json["orgAccountType"] as RootEntityTyps) {
      case RootEntityTyps.Appcntroler:
        return Appcntroler.fromJson(json);
        break;
      default:
        return throw {"Error undefined ${json["orgAccountType"]}}"};
    }
  }
}
