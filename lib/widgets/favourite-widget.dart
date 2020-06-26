import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/widgets/vert_store_card.dart';
import 'package:scoped_model/scoped_model.dart';

class FavouriteWidget extends StatefulWidget {
  final MainModel model;
  FavouriteWidget({this.model});
  @override
  _FavouriteWidgetState createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {

  // void initState() {
  //   super.initState();
  //   widget.model.fetchFavStores();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        List<Store> favStores = model.favStores;
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.favStores.length,
            itemBuilder: (BuildContext lctx, int index) {
              // Store store = stores[index];
              return Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 10.0),
                child: VerticalStoreCard(favStores[index], model),
              );
            });
      })),
    );
  }
}
