import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nofomo/models/store.dart';


class DistanceCalculator extends StatefulWidget {
  final Store store;
  DistanceCalculator(this.store);

  @override
  _DistanceCalculatorState createState() => _DistanceCalculatorState();
}

class _DistanceCalculatorState extends State<DistanceCalculator> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  double _distance;
  Store store;


  void initState() {
    super.initState();
    _getCurrentLocation();
    store = widget.store;
  }
  @override
  Widget build(BuildContext context) {
    _getDistance();
    return Text(_distance.toStringAsFixed(0) + 'm');
  }
  
  _getCurrentLocation() async {
    //lat and long
    try {
      await geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
        });
      });
    } catch (e) {
      print(e);
    }
  }

   _getDistance() async {
    _getCurrentLocation();
    //lat and long
    try {
      await geolocator
          .distanceBetween(_currentPosition.latitude,
              _currentPosition.longitude, store.lat, store.long)
          .then((double distance) {
        setState(() {
          _distance = distance;
        });
      });
    } catch (e) {
      print(e);
    }
  }

}

  // Future<bool> getDistance() async {
  //   var distanceInMeters;
  //   try {
  //     distanceInMeters = await _geolocator.distanceBetween(
  //         _currentPosition.latitude,
  //         _currentPosition.longitude,
  //         widget.store.lat,
  //         widget.store.long);
  //     setState(() {
  //       _distance = distanceInMeters.toStringAsFixed(0);
  //     });
  //     return Future.value(true);
  //   } catch (e) {
  //     print(e);
  //     return Future.value(false);
  //   }
  //   // return distanceInMeters;
  // }