import 'package:flutter/material.dart';
import 'package:nofomo/models/nofomo.dart';
import 'package:nofomo/services/auth.dart';
import 'package:nofomo/services/database.dart';
import 'package:provider/provider.dart';
import 'package:nofomo/screens/home/nofomo_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<NoFomo>>.value(
      value: DatabaseService().nofomo,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('noFOMO'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout'),
            )
          ],
        ),
        body: NoFomoList(),
      ),
    );
  }
}
