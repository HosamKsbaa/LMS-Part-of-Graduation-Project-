import './message.dart';
import 'Contact_&_RelationState.dart';

class Conversation {
  List<Contact> contact;

  List<Message> messages;

  int unreadedMsgsConunter;

  //Constructor
  Conversation({List<Contact> contact, List<Message> messages, int unreadedMsgsConunter}) {
    this.contact = contact;
    this.messages = messages;
    this.unreadedMsgsConunter = unreadedMsgsConunter;
  }

  void sendMessage(Message m) {
    //firebase
    messages.add(m);
  }

  void receiveMessage() {
    //
    this.unreadedMsgsConunter++;
  }

  void readMessage() {
    // i need to know the number of unreaded messages per conversation
    for (int i = 0; i < messages.length; i++) {
      if (messages[i].readBy == false) {
        this.unreadedMsgsConunter--;
      }
    }
  }

  void mute() {
    //
  }

  void notifyUser(int index) {
    if (contact[index].mutecontact) {}
  }
}
