import 'package:contacts_app/utils/app_drawer.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Contacts App'),
        ),
        drawer: AppDrawer(),
      ),
    );
  }
}
