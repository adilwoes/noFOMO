import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';

class WhatsHot extends StatelessWidget {
  final listOfStores = <Store>[
    Store(
      title: 'Adilwoes\'s Pizzeria',
      price: '5.00',
      img: 'assets/images/pizza.jpg',
    ),
    Store(
      title: 'Jovi\'s Steakhouse',
      price: '7.00',
      img: 'assets/images/steak.jpg',
    ),
    Store(
      title: 'Shuen\'s Desserts',
      price: '5.00',
      img: 'assets/images/waffle.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: listOfStores.map<Widget>((Store store) {
          return GestureDetector(
              onTap: () {}, //ontap need to edit
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 30.0), //bottom here changes the length 
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
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0,),
                        child: Text(
                          store.title,
                          style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
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
                                Row(children: <Widget>[
                                  Icon(Icons.location_on),
                                  Text('location (in distance)', style: TextStyle( //need to find the location, compute distance then input here
                                    fontSize: 18.0
                                  ),),
                                ],)
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
              ));
        }).toList());
  }
}
