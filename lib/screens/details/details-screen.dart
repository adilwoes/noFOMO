import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';

import 'components/app_bar.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Store store;

  DetailsScreen({@required this.store});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: detailsAppBar(context),
      body: Body(store: store),
    );
  }
}



