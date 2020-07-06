import 'dart:io';

import 'package:contacts_app/bloc/contact_bloc.dart';
import 'package:contacts_app/data/contact.dart';
import 'package:contacts_app/screens/form/contact_image.dart';
import 'package:contacts_app/screens/form/form_data.dart';
import 'package:contacts_app/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewContactForm extends StatefulWidget {
  ContactBloC contactBloc;

  NewContactForm(this.contactBloc);

  @override
  _NewContactFormState createState() => _NewContactFormState(contactBloc);
}

class _NewContactFormState extends State<NewContactForm> {
  final _formKey = GlobalKey<FormState>();
  FormData formData = FormData();
  bool _isFavorite;
  File _image;
  ContactBloC contactBloc;

  _NewContactFormState(this.contactBloc);

  @override
  Widget build(BuildContext context) {
    print('_isFavorite in build = $_isFavorite');
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ContactImage(_image, getImage),
          Column(
            children: <Widget>[
              CustomTextFormField(
                hintText: 'Name',
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
                onSaved: (String value) {
                  formData.name = value;
                },
              ),
              CustomTextFormField(
                hintText: 'Mobile',
                isPhone: true,
                validator: (String value) {
                  if (value.length < 10) {
                    return 'Please enter a valid mobile number';
                  }
                  return null;
                },
                onSaved: (String value) {
                  formData.mobile = value;
                },
              ),
              CustomTextFormField(
                hintText: 'Landline',
                isPhone: true,
                validator: (String value) {
                  if (value.length < 10) {
                    return 'Please enter a valid landline number';
                  }
                  _formKey.currentState.save();
                  return null;
                },
                onSaved: (String value) {
                  formData.landline = value;
                },
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 60.0,
            child: FlatButton(
              color: Colors.grey.shade200,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print('favorite =  $_isFavorite');
                  print('formData.name = ${formData.name}');
                  print('formData.mobile = ${formData.mobile}');
                  print('formData.landline = ${formData.landline}');
                  print('formData.avatar_path = ${formData.avatar_path}');

                  print('form validated !!');
                  _formKey.currentState.save();
                  Contact contact = Contact(

                  );
                  contactBloc.createContact(contact);
                }
              },
              child: Text('Save'),
            ),
          )
        ],
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await _pickImage(context);

    setState(() {
      _image = File(pickedFile.path);
    });

    formData.avatar_path = _image.path;
  }

  static Future<File> _pickImage(BuildContext context) async {
    var imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Select the image source"),
              actions: <Widget>[
                MaterialButton(
                  child: Text("Camera"),
                  onPressed: () => Navigator.pop(context, ImageSource.camera),
                ),
                MaterialButton(
                  child: Text("Gallery"),
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                )
              ],
            ));

    if (imageSource != null) {
      var file = await ImagePicker.pickImage(
          source: imageSource, maxHeight: 220.0, maxWidth: 220.0);
      if (file != null) {
        return file;
      }
      return null;
    }
  }
}
