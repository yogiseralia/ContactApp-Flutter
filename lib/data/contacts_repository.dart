import 'package:contacts_app/data/contact.dart';
import 'package:contacts_app/data/contact_dao.dart';

class ContactsRepository {
  final contactDao = ContactsDao();

  Future getAllContacts({String query}) => contactDao.getContacts(query: query);

  Future insertContact(Contact todo) => contactDao.createContact(todo);

  Future updateContact(Contact todo) => contactDao.updateTodo(todo);
}