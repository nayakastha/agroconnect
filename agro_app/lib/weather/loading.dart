import 'package:agro_app/weather/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

final Geolocator geolocator = Geolocator();

getCurrentLocation() {
  Position _currentPosition;
  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position) {
    _currentPosition = position;
  }).catchError((e) {
    print(e);
  });
  return _currentPosition;
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Position position = getCurrentLocation();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              WeatherScreen(position.latitude, position.longitude)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
