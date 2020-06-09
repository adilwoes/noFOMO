import 'package:flutter/material.dart';
import 'package:nofomo/widgets/favourite-widget.dart';

class FavouritesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Center(
          child: RichText(text: TextSpan(
            style: TextStyle(
              fontSize: 34.0,
              fontFamily: 'Bebas',
            ),
            children: <TextSpan>[
              TextSpan(text: 'No', style: TextStyle(color: Colors.white)),
              TextSpan(text: 'FOMO', style: TextStyle(color: Colors.orange[200]))
            ]
          )),
        ),
        backgroundColor: Colors.black,
      ),
      body: FavouriteWidget()
    );
  }
}


      
    
  

