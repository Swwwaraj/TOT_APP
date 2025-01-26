import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;

  Position? get currentPosition => _currentPosition;

  Future<void> getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    notifyListeners();
  }
}