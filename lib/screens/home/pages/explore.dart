import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/widgets/hot-stores.dart';
import 'package:nofomo/widgets/nearby.dart';

class Explore extends StatefulWidget {
  final MainModel model;

  Explore({this.model});

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<Store> stores;
  List<Store> favStores;

  @override
  void initState() {
    widget.model.fetchStores();
    widget.model.fetchFavStores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    stores = widget.model.stores;
    favStores = widget.model.favStores;
    print('building explore');
    print('favstores: ' + favStores.length.toString());
    print('stores: ' + widget.model.storeLength.toString());
    //pass the stores into hotstores
    //only built once
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: RefreshIndicator(
        onRefresh: widget.model.fetchStores,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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

              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                      height: 265.0,
                      child:
                          // ScopedModelDescendant<MainModel>(
                          //   builder: (BuildContext context, Widget child, MainModel model) {
                          //     return
                          HotStores(stores: stores, favStores: favStores))),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Near you',
                    style: const TextStyle(
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

              // Padding(
              //   padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              //   child: Align(
              //     alignment: Alignment.topLeft,
              //     child: const Text(
              //       'Your Favourites',
              //       style: const TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold,
              //           fontFamily: 'Bebas',
              //           fontSize: 26.0),
              //     ),
              //   ),
              // ),

              // Padding(
              //   padding: const EdgeInsets.only(right: 20.0),
              //   child: Container(
              //     height: 265.0,
              //     child: Fav(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
