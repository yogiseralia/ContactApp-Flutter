import 'dart:async';

import 'package:contacts_app/data/contact.dart';
import 'package:contacts_app/data/contacts_repository.dart';

class ContactBloC {
  //Get instance of the Repository
  final _contactsRepository = ContactsRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _contactsController = StreamController<List<Contact>>.broadcast();

  get contacts => _contactsController.stream;

  ContactBloC() {
    getContacts();
  }

  getContacts({String query}) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _contactsController.sink.add(await _contactsRepository.getAllContacts(query: query));
  }

  createContact(Contact todo) async {
    await _contactsRepository.insertContact(todo);
    getContacts();
  }

  updateContact(Contact todo) async {
    await _contactsRepository.updateContact(todo);
    getContacts();
  }

  dispose() {
    _contactsController.close();
  }
}