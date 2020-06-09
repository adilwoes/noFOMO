import 'package:flutter/material.dart';
import 'package:nofomo/models/favmodel.dart';
import 'explore.dart';
import 'favourites-page.dart';
import 'browse.dart';
import 'settings.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Explore(),
    Browse(),
    FavouritesPage(),
    Settings(),
  ];

  //might have to maintain the state of the red hearts here as well...

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavModel(),
      child: Scaffold(
        body: _children[_currentIndex], //how to use indexed stack?
        bottomNavigationBar: botNavBar(),
      ),
    );
  }

  BottomNavigationBar botNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.blueGrey[50],
      onTap: onTabTapped,
      selectedItemColor: Colors.orange[400],
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[700],
      currentIndex: _currentIndex,
      items: [
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
  }
}
