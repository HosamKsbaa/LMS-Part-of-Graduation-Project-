import 'Contact_&_RelationState.dart';

class Message {
  DateTime dateTime;
  List<Contact> receivedBy;
  bool readBy;

  //constructor
  Message(List<Contact> rB) {
    this.readBy = false;
    this.dateTime = DateTime.now();
    receivedBy = rB;
  }

  void delete() {
    this.dateTime = this.receivedBy = null;
    this.readBy = false;
  }

  //no need of save method as msg already exist in user database
  // void save(){
  //
  // }

}
