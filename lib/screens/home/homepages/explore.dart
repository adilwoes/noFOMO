import 'package:flutter/material.dart';
import 'package:nofomo/widgets/fav.dart';
import 'package:nofomo/widgets/nearby.dart';
import 'package:nofomo/widgets/whatshot.dart';

class Explore extends StatefulWidget {
  Explore({Key key}) : super(key: key);

  //final String title;
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
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
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'What\'s hot!',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Bebas',
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                  ),

                  Spacer(),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Show All',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Bebas',
                            color: Colors.black,
                          ),
                        ),
                        Icon(Icons.arrow_right, color: Colors.black)
                      ],
                    ),
                  )
                ],
              ),
            ),

            //after what's hot, still part of column

            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 265.0,
                child:
                    WhatsHot(), //obviously this part would have to be based on location
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Near you',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bebas',
                      fontSize: 26.0),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 265.0,
                child:
                    NearBy(), //obviously this part would have to be based on location
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your Favourites',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bebas',
                      fontSize: 26.0),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                height: 265.0,
                child: Fav(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
