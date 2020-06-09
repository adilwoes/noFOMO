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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: RichText(text: TextSpan(
            style: TextStyle(
              fontSize: 34.0,
              fontFamily: 'Bebas',
            ),
            children: <TextSpan>[
              TextSpan(text: 'No', style: TextStyle(color: Colors.white)),
              TextSpan(text: 'FOMO', style: TextStyle(color: Colors.orange[200]))
            ]
          )),
        ),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: AllStores()
    );
  }
}

