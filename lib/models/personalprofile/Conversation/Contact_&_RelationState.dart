import 'package:lms/models/personalprofile/UserProfile+/2_UserpublicData.dart';

enum RelationStats { friend, supervisor, colleague }

class Contact {
  UserPublicData contact;
  List<RelationStats> relationStats;
  DateTime relationStartingDate;
  bool mutecontact;

  //Constructor
  Contact({UserPublicData contact, List<RelationStats> relationStats, DateTime relationStartingDate, bool mutecontact}) {
    this.contact = contact;
    this.relationStats = relationStats;
    this.relationStartingDate = relationStartingDate;
    this.mutecontact = mutecontact;
  }

  void addFriend(int index) {
    this.relationStats[index] = RelationStats.friend;
  }

  void block(int index) {
    if (this.relationStats == RelationStats.friend) this.relationStats[index] = RelationStats.colleague;
  }

  void mute() {
    if (mutecontact == true) return;
    mutecontact = true;
  }
}
