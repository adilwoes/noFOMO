import 'package:flutter/material.dart';
import 'package:nofomo/screens/authenticate/authenticate.dart';
import 'package:nofomo/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:nofomo/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either Home or Authenticate Widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
