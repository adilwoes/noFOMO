import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/screens/details/details-screen.dart';

class NearBy extends StatefulWidget {
  _NearByState createState() => _NearByState();
}

class _NearByState extends State<NearBy> {
  final Set<Store> _saved = new Set<Store>();

  final listOfStores = <Store>[
    Store(
      title: 'Mario\'s Pasta',
      price: '5.00',
      img: 'assets/images/pasta.jpg',
    ),
    Store(
      title: 'Luigi\'s Gelato',
      price: '7.00',
      img: 'assets/images/gelato.jpg',
    ),
    Store(
      title: 'Peach\'s Burgers',
      price: '5.00',
      img: 'assets/images/burger.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return buildList(listOfStores);
  }

  Widget buildList(List<Store> storeList) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
          scrollDirection: Axis.horizontal,
          children: storeList.map<Widget>((Store store) {
            final bool alreadySaved = _saved.contains(store);
            return GestureDetector(
              onTap: () {
                print('tapped on container');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsScreen(store: store);
                }));
              }, //ontap need to edit
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.0,
                    top: 10.0,
                    bottom: 30.0), //bottom here changes the length
                child: Container(
                  width: 300.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300], width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.topRight,
                        children: <Widget>[
                          Container(
                            height: 140.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                    image: AssetImage(store.img),
                                    fit: BoxFit.cover)),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (alreadySaved) {
                                  _saved.remove(store);
                                } else {
                                  _saved.add(store);
                                }
                              });
                              //favourites.add(store)
                              //display on favourites page
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.withOpacity(0.2),
                              radius: 25.0,
                              child: Icon(
                                  alreadySaved
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      alreadySaved ? Colors.red : Colors.white,
                                  size: 30.0),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                        ),
                        child: Text(
                          store.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 5.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on),
                                    Text(
                                      'location (in distance)',
                                      style: TextStyle(
                                          //need to find the location, compute distance then input here
                                          fontSize: 15.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text(
                              "\$" + store.price,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
