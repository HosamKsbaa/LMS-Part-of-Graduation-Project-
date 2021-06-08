import 'package:json_annotation/json_annotation.dart';

import '../OrgAccount.dart';

part 'Parent.g.dart';

@JsonSerializable()
class Parent extends OrgAccount {
  Parent({
    String type = "parent",
    String orgid,
    List<String> eventpointer,
  }) : super(orgAccountType: type, eventpointer: eventpointer, orgid: orgid);

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);
}
