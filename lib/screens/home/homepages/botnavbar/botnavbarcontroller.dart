import 'package:flutter/material.dart';
import 'package:nofomo/screens/home/homepages/browse.dart';
import 'package:nofomo/screens/home/homepages/favourites-page.dart';
import 'package:nofomo/screens/home/homepages/settings.dart';

import '../explore.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    Explore(
      key: PageStorageKey('Explore'),
    ),
    Browse(
      key: PageStorageKey('Browse'),
    ),
    FavouritesPage(),
    Settings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text(
              'Explore',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text(
              'Browse',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(
              'Favourites',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text(
              'Settings',
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      )
    );
  }
}
