import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nofomo/models/store.dart';

class Fav extends StatelessWidget {
  final listOfStores = <Store>[];
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: DottedBorder(
                dashPattern: [12, 4, 12, 4],
                radius: Radius.circular(10),
                color: Colors.grey[700],
                child: Container(
                  height: 200,
                  width: 300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: DottedBorder(
                dashPattern: [12, 4, 12, 4],
                radius: Radius.circular(10),
                color: Colors.grey[700],
                child: Container(
                  height: 200,
                  width: 300,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

//gonna need to find a way to like add the image into the dotted borders when someone favourites it
//probs if else statement?
//fav on home page
