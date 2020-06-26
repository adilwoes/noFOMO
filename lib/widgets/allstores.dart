import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:nofomo/widgets/vert_store_card.dart';
import 'package:scoped_model/scoped_model.dart';

//this will be for the browsing page
class AllStores extends StatefulWidget {
  _AllStoresState createState() => _AllStoresState();
}

class _AllStoresState extends State<AllStores> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        model.fetchStores();
        List<Store> stores = model.stores;
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: model.storeLength,
            itemBuilder: (BuildContext lctx, int index) {
              // Store store = stores[index];
              return Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 10.0),
                child: VerticalStoreCard(stores[index], model),
              );
            });
      })),
    );
  }
}
