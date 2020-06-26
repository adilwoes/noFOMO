import 'package:flutter/material.dart';
import 'package:nofomo/widgets/allstores.dart';

class Browse extends StatefulWidget {
    Browse({Key key}) : super(key: key);

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: AllStores()
    );
  }
}

