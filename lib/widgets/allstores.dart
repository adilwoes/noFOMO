import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';
import 'package:nofomo/scoped_model/main_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'cards/vert_store_card.dart';

//this will be for the browsing page
class AllStores extends StatefulWidget {
  final List<Store> stores;
  final List<Store> favStores;
  final List<Store> allStores;
  AllStores({this.stores, this.favStores, this.allStores});

  _AllStoresState createState() => _AllStoresState();
}

class _AllStoresState extends State<AllStores> {
  @override
  Widget build(BuildContext context) {
    print('building allstores');

    return Scaffold(
      body: Container(child: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.allStores.length,
            itemBuilder: (BuildContext lctx, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 10.0),
                child: VerticalStoreCard(
                  widget.allStores[index],
                  model,
                  widget.favStores,
                ),
              );
            });
      })),
    );
  }
}
