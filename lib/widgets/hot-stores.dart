import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/widgets/horiz_store_card.dart';
import 'package:scoped_model/scoped_model.dart';

class HotStores extends StatefulWidget {
  final MainModel model;
  HotStores({this.model});

  _HotStoresState createState() => _HotStoresState();
}

class _HotStoresState extends State<HotStores> {
  @override
  void initState() {
    super.initState();
    widget.model.fetchStores();
  }
  //the initState prevents the infinite loop of rebuilding the widget because the notifyListener in the fetchStores method
  //will result in the widget rebuilding itself. Upon rebuilding, the fetchStores inside built will be called again resulting
  //in a loop that will never end. This could result in performance issues. Hence, using the initState might be better for
  //performance if database is huge.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Container(child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        // model.fetchStores();
        // model.fetchFavStores();
        List<Store> stores = model.stores;

        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: model.storeLength,
            itemBuilder: (BuildContext lctx, int index) {
              // Store store = stores[index];
              return HorizontalStoreCard(stores[index], model);
            });
      })),
    );
  }
}


