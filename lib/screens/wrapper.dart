import 'package:flutter/material.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/screens/authenticate/authenticate.dart';
import 'package:nofomo/screens/home/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:nofomo/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

class Wrapper extends StatelessWidget {
  final MainModel mainModel = MainModel();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either Home or Authenticate Widget
    if (user == null) {
      return Authenticate();
    } else {
      return ScopedModel<MainModel>(
        model: mainModel,
        child: Home(model: mainModel),
        // AddStore()
      );
    }
  }
}
