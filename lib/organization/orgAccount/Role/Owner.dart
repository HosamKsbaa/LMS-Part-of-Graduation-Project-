import 'package:json_annotation/json_annotation.dart';

import '../OrgAccount.dart';

part 'Owner.g.dart';

@JsonSerializable(explicitToJson: true)
class Owner extends OrgAccount {
  Owner({
    String type = "owner",
    String orgid,
    List<String> eventpointer,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);

  @override
  void firstTimeInit() {
    // TODO: implement firstTimeInit
  }

  @override
  void subWaitFor() {
    // TODO: implement subWaitFor
  }
}
