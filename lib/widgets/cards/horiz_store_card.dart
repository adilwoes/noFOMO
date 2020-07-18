import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/screens/details/details-screen.dart';
import 'package:nofomo/widgets/local_push_notification.dart';

class HorizontalStoreCard extends StatefulWidget {
  final Store store;
  final MainModel model;
  final List<Store> favStores;

  HorizontalStoreCard(this.store, this.model, this.favStores);

  _HorizontalStoreCardState createState() => _HorizontalStoreCardState();
}

class _HorizontalStoreCardState extends State<HorizontalStoreCard> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  LocalNotification localNotification = LocalNotification();
  Position _currentPosition;
  double _distance;

  // void initState() {
  //   super.initState();
  //   // widget.model.fetchStores();
  //   // widget.model.fetchFavStores();
  //   _getCurrentLocation().then((position) {
  //     _currentPosition = position;
  //   });
  //   localNotification.initializing();
  // }

  @override
  Widget build(BuildContext context) {
    // _getDistance();
    //not due to getting distance
    print('building horiz card');
    List<Store> favStores = widget.favStores;
    // print(favStores.length); 
    return GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(store: widget.store))),
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
                              image: AssetImage(widget.store.img), //
                              fit: BoxFit.cover)),
                    ),
                    // FlatButton(
                    //   child: Text('notify'),
                    //   color: Colors.blue,
                    //   onPressed: localNotification.showNotification,
                    // ),
                    GestureDetector(
                      onTap: () {
                        favStores
                                .any((element) => element.id == widget.store.id)
                            ? {
                                widget.model.deleteStore(widget.store.id),
                                favStores.remove(widget.store)
                              }
                            : {
                                widget.model.addFavStore(widget.store),
                                favStores.add(widget.store)
                              };
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        radius: 25.0,
                        child: Icon(
                          favStores.any(
                                  (element) => element.id == widget.store.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favStores.any(
                                  (element) => element.id == widget.store.id)
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
                    //title
                    widget.store.title,
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
                          SizedBox(width: 10.0),
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on),
                              if (_distance != null)
                                Text(
                                  _distance < 500
                                      ? _distance.toStringAsFixed(0) + 'm'
                                      : '>500m',
                                  style: TextStyle(fontSize: 18.0),
                                )
                            ],
                          )
                        ],
                      ),
                      Text(
                        "\$" + widget.store.price.toStringAsFixed(2),
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

  _getCurrentLocation() async {
    //lat and long
    var currentPosition;
    try {
      currentPosition = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      //   .then((Position position) {
      // setState(() {
      //   _currentPosition = position;
      // });
    } catch (e) {
      print(e);
    }
    return currentPosition;
  }

  _getDistance() async {
    //lat and long
    try {
      await geolocator
          .distanceBetween(_currentPosition.latitude,
              _currentPosition.longitude, widget.store.lat, widget.store.long)
          .then((double distance) {
        setState(() {
          _distance = distance;
        });
      });
      print('getting distance');
      // if (_distance < 500) {
      //   localNotification.showNotification();
      // }
    } catch (e) {
      print(e);
    }
  }
}
