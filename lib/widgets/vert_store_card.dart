import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/screens/details/details-screen.dart';


class VerticalStoreCard extends StatelessWidget {
  final Store store;
  final MainModel model;
  // final String title;
  // final String description;
  // final double price;
  // final String img;

  VerticalStoreCard(this.store, this.model);

  @override
  Widget build(BuildContext context) {
    model.fetchFavStores();
    List<Store> favStores =
        model.favStores; //retrieves the favorited stores in the database
    return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(store: store))),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0,
          ), //bottom here changes the length
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
                              image: AssetImage(store.img), //
                              fit: BoxFit.cover)),
                    ),
                    GestureDetector(
                      onTap: () {
                        print(favStores.length);
                        favStores.any((element) => element.id == store.id)
                            ? model.deleteStore(store.id)
                            : model.addFavStore(store);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        radius: 25.0,
                        child: Icon(
                          favStores.any((element) => element.id == store.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color:
                              favStores.any((element) => element.id == store.id)
                                  ? Colors.red
                                  : Colors.white,
                          size: 30.0,
                        ),
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
                              Text('300m')
                              // DistanceCalculator(store) //error to be fixed
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
                ),
                SizedBox(height: 10.0)
              ],
            ),
          ),
        ));
  }
}
