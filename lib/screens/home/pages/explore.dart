import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/widgets/cards/horiz_store_card.dart';
import 'package:scoped_model/scoped_model.dart';

class Explore extends StatefulWidget {
  final MainModel model;

  Explore({this.model});
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  GlobalKey<ScaffoldState> _explorePageScaffoldKey = GlobalKey();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    widget.model.fetchStores();
    widget.model.fetchFavStores();
    widget.model.fetchAllStores();
    widget.model.fetchNearStores();
    _getCurrentLocation().then((position) {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _explorePageScaffoldKey,
      backgroundColor: Colors.blueGrey[50],
      body: RefreshIndicator(
        onRefresh: widget.model.fetchStores,
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  'What\'s hot!',
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Bebas',
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 230.0,
              child: ScopedModelDescendant<MainModel>(
                builder: (BuildContext sctx, Widget child, MainModel model) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.storeLength,
                        itemBuilder: (BuildContext lctx, int index) {
                          return HorizontalStoreCard(model.stores[index], model,
                              model.favStores, _currentPosition);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Near you',
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Bebas',
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 230.0,
              child: ScopedModelDescendant<MainModel>(
                builder: (BuildContext sctx, Widget child, MainModel model) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.nearStoreLength,
                        itemBuilder: (BuildContext lctx, int index) {
                          return HorizontalStoreCard(model.nearStores[index],
                              model, model.favStores, _currentPosition);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
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
}

// stores = widget.model.stores;
// favStores = widget.model.favStores;
// print('building explore');
// print('favstores: ' + favStores.length.toString());
// print('stores: ' + widget.model.storeLength.toString());
//pass the stores into hotstores
//only built once
// return Scaffold(
//   backgroundColor: Colors.blueGrey[50],
//   body: RefreshIndicator(
//     onRefresh: widget.model.fetchStores,
//     child: SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           SizedBox(height: 30.0),

//           Padding(
//               padding: const EdgeInsets.only(right: 20.0),
//               child: Container(
//                   height: 265.0,
//                   child:
//                       // ScopedModelDescendant<MainModel>(
//                       //   builder: (BuildContext context, Widget child, MainModel model) {
//                       //     return
//                       HotStores(stores: stores, favStores: favStores))),

//           // Padding(
//           //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//           //   child: Align(
//           //     alignment: Alignment.topLeft,
//           //     child: const Text(
//           //       'Your Favourites',
//           //       style: const TextStyle(
//           //           color: Colors.black,
//           //           fontWeight: FontWeight.bold,
//           //           fontFamily: 'Bebas',
//           //           fontSize: 26.0),
//           //     ),
//           //   ),
//           // ),

//           // Padding(
//           //   padding: const EdgeInsets.only(right: 20.0),
//           //   child: Container(
//           //     height: 265.0,
//           //     child: Fav(),
//           //   ),
//           // ),
//         ],
//       ),
//     ),
//   ),
// );
