import 'package:flutter/material.dart';
import 'package:nofomo/widgets/nearby.dart';
import 'package:nofomo/widgets/whatshot.dart';

class Explore extends StatefulWidget {
  Explore({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 5.0),
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 5.0),
                            Text(
                              'Search',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.filter_list, color: Colors.white),
                  )
                ],
              ),
            ),

            SizedBox(height: 10.0),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'What\'s hot!',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
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
                            fontFamily: 'Montserrat',
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
                      fontFamily: 'Montserrat',
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

          ],
        ),
        
      ),
    );
  }
}


