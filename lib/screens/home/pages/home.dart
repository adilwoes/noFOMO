import 'package:flutter/material.dart';
import 'package:nofomo/models/favmodel.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/screens/home/pages/location.dart';
import 'explore.dart';
import 'favourites-page.dart';
import 'browse.dart';
import 'settings.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final MainModel model;

  Home({this.model});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontSize: 34.0,
                      fontFamily: 'Bebas',
                    ),
                    children: <TextSpan>[
                  TextSpan(text: 'No', style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: 'FOMO', style: TextStyle(color: Colors.orange[200]))
                ])),
          ),
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: botNavBar(),
        body: IndexedStack(
          children: <Widget>[
            Explore(),
            Browse(),
            FavouritesPage(),
            // LocationPage(),
            Settings(),
          ],
          index: _currentIndex,
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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

// final List<Widget> _children = [
//   Explore(),
//   Browse(),
//   FavouritesPage(),
//   Settings(),
// ];

// List<Widget> pages;
// Explore explore;
// Browse browse;
// FavouritesPage favouritesPage;
// Settings settings;
// Widget currentPage;

// void initState() {
//   widget.model.fetchStores();

//   explore = Explore();
//   browse = Browse();
//   favouritesPage = FavouritesPage();
//   settings = Settings();
//   pages = [explore, browse, favouritesPage, settings];

//   currentPage = explore;
//   super.initState();
// }
