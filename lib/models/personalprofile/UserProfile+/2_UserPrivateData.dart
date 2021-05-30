import '../../userOrganizationAccountPackage/UserOrganizationAccount.dart';
import '../Conversation/Contact_&_RelationState.dart';
import '../Conversation/Conversation.dart';

class UserPrivateData {
  String lname;
  String gender;
  DateTime birthDate;
  String phoneNumber;
  String email;
  List<Contact> _contacts;
  List<Conversation> _conservations;
  List<UserOrganizationAccount> _userOrganizationAccounts;

  //Constructor
  UserPrivateData({String lname, String gender, DateTime birthDate, String phoneNumber, String email, List<Contact> contacts, List<Conversation> conservations, List<UserOrganizationAccount> userOrganizationAccounts}) {
    this.gender = gender;
    this.birthDate = birthDate;
    this.phoneNumber = phoneNumber;
    this.email = email;
    this._contacts = contacts;
    this._conservations = conservations;
    this._userOrganizationAccounts = userOrganizationAccounts;
  }

  void editData() {
    // similar to edit data in user public data class
  }

  void addNewContact(Contact contact) {
    this._contacts.add(contact);
  }

  void startNewConservation(Conversation c) {
    this._conservations.add(c);
  }

  void login_To_New_Organsation() {}
}
