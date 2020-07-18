import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/widgets/favourite-widget.dart';

class FavouritesPage extends StatefulWidget {

  final MainModel model;

  FavouritesPage({this.model});
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  List<Store> stores;
  List<Store> favStores;

  // @override
  // void initState() {
  //   widget.model.fetchStores();
  //   widget.model.fetchFavStores();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    stores = widget.model.stores;
    favStores = widget.model.favStores;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: FavouriteWidget(stores: stores, favStores: favStores)
    );
  }
}


      
    
  

