import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/services/auth.dart';
import 'package:nofomo/widgets/dist_calc.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: RaisedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text('sign out bitch'))));
  }
}
