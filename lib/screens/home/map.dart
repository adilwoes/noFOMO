import 'package:flutter/material.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

// Container(
//             height: 400.0,
//             child: ListView(
//               scrollDirection: Axis.vertical,
//               children: <Widget>[
//                 getPlaces(),
//                 SizedBox(width: 15.0),
//                 getPlaces(),
//                 SizedBox(width: 15.0),
//                 getPlaces(),
//                 SizedBox(width: 15.0),
//               ],
//             ),
//           )

//getPlaces() {
//   return Column(
//     children: <Widget>[
//       Container(
//         height: 150.0,
//         width: 300.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.0),
//           image: DecorationImage(image: AssetImage('assets/images/table-with-grains-vegetables-fruit-768.jpg'))
//         ),
//       ),

//       SizedBox(height: 5.0),
//       Text('Adil\'s Diner', style: TextStyle(
//         color: Colors.black,
//         fontFamily: 'Montserrat',
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold
//       ),),
      
//       SizedBox(height: 10.0),
//       Text('Jovi\'s Pasta', style: TextStyle(
//         color: Colors.grey,
//         fontFamily: 'Montserrat'
//       ),),

//       SizedBox(height: 5.0),
//       Row(children: <Widget>[
//         Icon(Icons.star, color: Colors.yellow[600],),
//         SizedBox(width: 5.0),
//         Text('4.8', style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//           fontSize: 16.0,
//           fontFamily: 'Montserrat'
//         ),),

//         SizedBox(width: 5.0),
//         Text('(233 ratings)', style: TextStyle(
//           color: Colors.grey,
//           fontFamily: 'Montserrat'
//         ),),

//         SizedBox(width: 10.0),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.green,
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: Text('Free delivery', style: TextStyle(
//             color: Colors.white,
//             fontSize: 12.0
//           ),),
//         ),

//       ],)

//     ],
//   );
// }

// Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 height: 200.0,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: <Widget>[
//                     Container(
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         ),
//                         child: Column(
//                           children: <Widget>[
//                             Stack(
//                               alignment: Alignment.topRight,
//                               children: <Widget>[
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.only(
//                                     topRight: Radius.circular(10.0),
//                                     topLeft: Radius.circular(10.0),
//                                   ),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       Navigator.push(context, MaterialPageRoute(builder: (_) {
//                                         return Map();
//                                       }));
//                                     },
//                                     child: Hero(
//                                       tag: 'food',
//                                       child: Image.asset('assets/images/pizza.jpg', fit: BoxFit.fitWidth,)
//                                       ),
//                                   ),
//                                 ),
//                                 CircleAvatar(
//                                   backgroundColor: Colors.grey.withOpacity(0.7),
//                                   radius: 25.0,
//                                   child: Icon(Icons.favorite_border, color: Colors.white, size: 30.0),
//                                 )
//                               ],
//                             ),
//                             Row(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: <Widget>[
//                                       Padding(
//                                         padding: const EdgeInsets.all(5.0),
//                                         child: Text('Adilwoes Mango Waffles', style: TextStyle(
//                                           fontSize: 20.0,
//                                           color: Colors.black,
//                                         )),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(5.0),
//                                         child: Text('Continental', style: TextStyle(
//                                           fontSize: 12.0,
//                                           color: Colors.grey,
//                                         )),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Padding(
//                                   padding: const EdgeInsets.all(15.0),
//                                   child: Column(
//                                     children: <Widget>[
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                                           border: new Border.all(color: Colors.green),
//                                         ),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Icon(Icons.add, color: Colors.green, size: 20.0,),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       )
//                     ),

//                   ],
//                 ),
//               ),
//             ),