//keeps track of user location and stores around
//maybe wrapper can be passed as the body of the scaffold?


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationGetter extends ChangeNotifier {
  Position _currentPosition;
  Geolocator geolocator = Geolocator();
  var locationOptions =
      LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
  StreamSubscription<Position> _getPositionSubscription;

  Position get currentLocation => _currentPosition;

  getLocation() {
    _getPositionSubscription = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      _currentPosition = position;
      //check for stores and send notifs
    });
    notifyListeners();
  }
}
