import 'package:flutter/material.dart';
import 'package:nofomo/models/favmodel.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/screens/details/details-screen.dart';
import 'package:provider/provider.dart';

class WhatsHot extends StatefulWidget {
  final MainModel model;
  WhatsHot(this.model);

  _WhatsHotState createState() => _WhatsHotState();
}

class _WhatsHotState extends State<WhatsHot> {
  final listOfStores = <Store>[
    Store(
      title: 'Adilwoes\'s Pizzeria',
      price: 5.00,
      img: 'assets/images/pizza.jpg',
    ),
    Store(
      title: 'Jovi\'s Steakhouse',
      price: 7.00,
      img: 'assets/images/steak.jpg',
    ),
    Store(
      title: 'Shuen\'s Desserts',
      price: 5.00,
      img: 'assets/images/waffle.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return buildList(listOfStores, context);
  }

  Widget buildList(List<Store> storeList, BuildContext context) {
    var favModel = Provider.of<FavModel>(context);
    var favStores = favModel.favStores;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
        scrollDirection: Axis.horizontal,

        //children: widget.storeModel.stores.map((Store store));

        children: storeList.map<Widget>(
          (Store store) {
            return GestureDetector(
              onTap: () {
                print('tapped on container');
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen(store: store);
                  },
                ));
              },
              child: storeCard(store, favStores, favModel),
            );
          },
        ).toList(),
      ),
    );
  }

  Padding storeCard(Store store, List<Store> favStores, FavModel favModel) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20.0, top: 10.0, bottom: 30.0), //bottom here changes the length
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
                          image: AssetImage(store.img), fit: BoxFit.cover)),
                ),
                favButton(favStores, store, favModel)
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
                    "\$" + store.price.toStringAsFixed(2),
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
    );
  }

  GestureDetector favButton(List<Store> favStores, Store store, FavModel favModel) {
    return GestureDetector(
                onTap: () {
                  setState(() {
                    if (favStores.contains(store)) {
                      favStores.remove(store);
                    } else {
                      favStores.add(store);
                    }
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  radius: 25.0,
                  child: Icon(
                      favModel.favStores.contains(store)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: favModel.favStores.contains(store)
                          ? Colors.red
                          : Colors.white,
                      size: 30.0),
                ),
              );
  }
}
//How can i abstract away this whole chunk of code so that i dont have to repeat it twice in whatshot and nearby
//this uses provider
