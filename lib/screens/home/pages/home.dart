import 'package:flutter/material.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/services/auth.dart';
import 'explore.dart';
import 'favourites-page.dart';
import 'browse.dart';

class Home extends StatefulWidget {
  final MainModel model;

  Home({this.model});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  int _currentIndex = 0;

  //pages
  Explore explore;
  Browse browse;
  FavouritesPage favouritesPage;
  // Settings settings;

  List<Widget> pages;
  Widget currentPage;

  void initState() {
    super.initState();
    explore = Explore(model: widget.model);
    browse = Browse(model: widget.model);
    favouritesPage = FavouritesPage(model: widget.model);
    // settings = Settings();
    pages = [explore, browse, favouritesPage];

    currentPage = explore;
  }

  @override
  Widget build(BuildContext context) {
    print('building home');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 34.0,
              fontFamily: 'Bebas',
            ),
            children: <TextSpan>[
              TextSpan(text: 'No', style: TextStyle(color: Colors.white)),
              TextSpan(
                  text: 'FOMO', style: TextStyle(color: Colors.orange[200]))
            ],
          ),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          RaisedButton(
            color: Colors.black,
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text(
              "Sign out",
              style: TextStyle(
                backgroundColor: Colors.black,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: botNavBar(),
      body: currentPage,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      currentPage = pages[index];
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
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.more_horiz),
        //   title: Text(
        //     'Settings',
        //     style: TextStyle(
        //       fontFamily: 'Montserrat',
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
