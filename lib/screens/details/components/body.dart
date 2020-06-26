import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';

class Body extends StatelessWidget {
  final Store store;

  Body({this.store});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: size.height - 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(store.img), fit: BoxFit.cover),
              ),
            ),
            Container(
              height: 400.0,
              width: size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Icon(Icons.location_on,
                            color: Colors.grey[800], size: 30.0),
                        Text(
                          store.title,
                          style: TextStyle(
                            fontFamily: 'Bebas',
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]), //possible inkwell for location
                      SizedBox(width: 55.0),
                      Text("\$" + store.price.toStringAsFixed(2),
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      height: 200.0,
                      child: Text(
                        store.description,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                            ),
                      ),
                      //description and buttons
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50.0,
                            child: RaisedButton(
                              elevation: 5,
                              color: Colors.grey,
                              onPressed: () {
                                print(null);
                              },
                              child: Text(
                                'Directions',
                                style: TextStyle(
                                    fontFamily: 'Bebas',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            child: RaisedButton(
                              elevation: 5,
                              color: Colors.orange[200],
                              onPressed: () {
                                print(null);
                              },
                              child: Text(
                                'Reserve!',
                                style: TextStyle(
                                    fontFamily: 'Bebas',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
