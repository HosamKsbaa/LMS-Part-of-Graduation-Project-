//region header

abstract class ActivitySignetre {
  ActivitySignetre(this.userOrgnizationAccountId, this.postedAt);
  final String userOrgnizationAccountId;
  final DateTime postedAt;

  //region jsonApi
  factory ActivitySignetre.fromJson(Map<String, dynamic> json) {
    throw {"this Shoud be implemented only at intractionBlock  n "};
  }
  Map<String, dynamic> toJson();
  //endregion
}
