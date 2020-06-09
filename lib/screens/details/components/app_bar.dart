import 'package:flutter/material.dart';

AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
}