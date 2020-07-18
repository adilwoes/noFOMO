import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/widgets/allstores.dart';

class Browse extends StatefulWidget {
  final MainModel model;

  Browse({this.model});

  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {

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
    print("building browse");
    print('browse: ' + stores.length.toString());
    print('browse: ' + favStores.length.toString());
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: AllStores(stores: stores, favStores: favStores,)
    );
  }
}

