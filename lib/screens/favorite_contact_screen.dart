import 'package:contacts_app/utils/app_drawer.dart';
import 'package:flutter/material.dart';

class FavoriteContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Favorite Contacts',style: TextStyle(
            color: Colors.black
          ),),
          backgroundColor: Colors.white,
        ),
        drawer: AppDrawer(),
      ),
    );
  }
}
