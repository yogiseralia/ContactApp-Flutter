import 'dart:io';

import 'package:contacts_app/bloc/contact_bloc.dart';
import 'package:contacts_app/screens/form/form_data.dart';
import 'package:contacts_app/screens/form/new_contact_form.dart';
import 'package:contacts_app/utils/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateContactScreen extends StatefulWidget {
  final ContactBloC contactBloc = ContactBloC();

  @override
  State<StatefulWidget> createState() {
    return _CreateContactScreen(contactBloc);
  }
}

class _CreateContactScreen extends State<CreateContactScreen> {
  bool _isFavorite = false;

  ContactBloC contactBloc;

  _CreateContactScreen(this.contactBloc);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Add new Contact'),
          actions: <Widget>[
            IconButton(
              onPressed: (){
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
              icon: Icon(_isFavorite ? Icons.star:Icons.star_border),
              color: Colors.black,
            )
          ],
        ),
        drawer: AppDrawer(),
        body: NewContactForm(contactBloc),
      ),
    );
  }

}



