import 'package:contacts_app/screens/contact_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ContactsApp());
}

class ContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black
      ),
      home: ContactListScreen(),
    );
  }
}
