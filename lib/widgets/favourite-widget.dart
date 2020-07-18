import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/widgets/cards/vert_store_card.dart';
import 'package:scoped_model/scoped_model.dart';

class FavouriteWidget extends StatefulWidget {
  final List<Store> stores;
  final List<Store> favStores;
  FavouriteWidget({this.stores, this.favStores});

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
    print('building fav');
    return Scaffold(
      body: Container(child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.favStores.length,
            itemBuilder: (BuildContext lctx, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 10.0),
                child: VerticalStoreCard(widget.favStores[index], model, widget.favStores),
              );
            });
      })),
    );
  }
}
