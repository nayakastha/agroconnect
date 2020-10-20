import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

double latitude, longitude;

class Weather {
  Position position;
  double latitude, longitude;

  getPosition() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
  }

  getCurrentWeather() async {
    getPosition();
    var url =
        'http://api.weatherapi.com/v1/current.json?key=5916ce5bb20840b1a49191655201910&q=$latitude,$longitude';
    var response = await http.get(url);
  }
}
