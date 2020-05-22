import 'package:flutter/material.dart';
import 'package:nofomo/models/nofomo.dart';
import 'package:provider/provider.dart';

class NoFomoList extends StatefulWidget {
  @override
  _NoFomoListState createState() => _NoFomoListState();
}

class _NoFomoListState extends State<NoFomoList> {
  @override
  Widget build(BuildContext context) {

    final nofomo = Provider.of<List<NoFomo>>(context);
    nofomo.forEach((ele) { 
      print(ele.name);
      print(ele.phoneNumber);
    });
    
    return Container(
      
    );
  }
}