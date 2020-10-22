import 'location_screen.dart';
import '../services/weather.dart';

import 'package:flutter/material.dart';

var weatherData;
var hourlyData;
var dailyData;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    print('in init state');
  }

  Future getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    weatherData = await weatherModel.getLocationWeather();
    hourlyData = await weatherModel.getHourlyWeather();
    dailyData = await weatherModel.getDailyWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
            hourlyWeather: hourlyData,
            dailyWeather: dailyData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
