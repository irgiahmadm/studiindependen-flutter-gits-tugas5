import 'package:flutter/widgets.dart';
import '../contact/contact.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> _contactList = [
    Contact('Irgi', '086381931', 'Jl.Cipagalo'),
  ];
  Contact? _contact;

  List<Contact> get contactList => _contactList;
  Contact? get getContact => _contact;
  Contact? get deleteContact => _contact;

  set deleteContact(Contact? contact) {
    _contactList.remove(contact);
    notifyListeners();
  }

  set addContact(Contact contact) {
    _contactList.add(contact);
    notifyListeners();
  }

  void editContact(int index, Contact contact) {
    _contactList[index] = contact;
    notifyListeners();
  }
}
