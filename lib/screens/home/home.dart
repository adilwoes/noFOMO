import 'package:flutter/material.dart';
import 'package:nofomo/models/userdata.dart';
import 'package:nofomo/services/auth.dart';
import 'package:nofomo/services/database.dart';
import 'package:provider/provider.dart';
import 'package:nofomo/screens/home/userdata_list.dart';
import 'explore.dart';
import 'favourites.dart';
import 'map.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Explore(),
    Favourites(),
    Map(),
    Settings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
          selectedItemColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text(
              'Explore',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(
              'Favourites',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text(
              'Map',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text(
              'Settings',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
