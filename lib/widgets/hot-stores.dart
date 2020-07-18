import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'cards/horiz_store_card.dart';
import 'package:scoped_model/scoped_model.dart';

class HotStores extends StatefulWidget {
  // final MainModel model;
  final List<Store> stores;
  final List<Store> favStores;
  HotStores({this.stores, this.favStores});

  _HotStoresState createState() => _HotStoresState();
}

class _HotStoresState extends State<HotStores> {
  // @override
  // void initState() {
  //   super.initState();
  //   // widget.model.fetchStores();
  //   // widget.model.fetchFavStores();
  // }
  //the initState prevents the infinite loop of rebuilding the widget because the notifyListener in the fetchStores method
  //will result in the widget rebuilding itself. Upon rebuilding, the fetchStores inside built will be called again resulting
  //in a loop that will never end. This could result in performance issues. Hence, using the initState might be better for
  //performance if database is huge.

  @override
  Widget build(BuildContext context) {
    print('building hot-stores');
    print('hotstores stores: ' + widget.stores.length.toString());
    print('hotstores favstores: ' + widget.favStores.length.toString());

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Container(child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {

        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.stores.length,
            itemBuilder: (BuildContext lctx, int index) {
              return HorizontalStoreCard(widget.stores[index], model, widget.favStores);
            });
      })),
    );
  }
}
