import 'package:contacts_app/screens/contact_list_screen.dart';
import 'package:contacts_app/screens/create_contact_screen.dart';
import 'package:contacts_app/screens/favorite_contact_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                'Contacts App',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text(
              'Contact List',
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => ContactListScreen(),
//                ),
//              );
              return ContactListScreen();
            },
          ),
          ListTile(
            title: Text(
              'Favorite Contacts',
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteContactScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Create New Contact',
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateContactScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
