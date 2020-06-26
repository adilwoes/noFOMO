import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/services/auth.dart';
import 'package:nofomo/widgets/dist_calc.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Store store = Store(
      title: 'Mario\'s Pasta',
      price: 5.00,
      img: 'assets/images/pasta.jpg',
      lat: 1.37929,
      long: 103.939812);

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
        // child: DistanceCalculator(store)
        child: Center(
            child: RaisedButton(
                onPressed: () async {
                  await _auth.signOut();
                },
                child: Text('sign out bitch'))));
  }
}
