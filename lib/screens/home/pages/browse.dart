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
  List<Store> favStores;
  List<Store> allStores;

  // @override
  // void initState() {
  //   widget.model.fetchStores();
  //   widget.model.fetchFavStores();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    favStores = widget.model.favStores;
    allStores = widget.model.allStores;
    print("building browse");
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: AllStores(
          allStores: allStores,
          favStores: favStores,
        ));
  }
}
