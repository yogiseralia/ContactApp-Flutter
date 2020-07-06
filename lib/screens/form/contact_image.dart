import 'dart:io';

import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  final File image;
  final Function setImage;

  ContactImage(this.image, this.setImage);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
        onTap: setImage,
        child: Container(
          width: 100,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: image == null
                ? Icon(
                    Icons.add_a_photo,
                    color: Colors.black,
                  )
                : null,
            backgroundImage: image == null ? null : FileImage(image),
          ),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: new Border.all(
              color: Colors.black,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
