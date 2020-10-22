import 'location_screen.dart';
import '../services/weather.dart';

import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var weatherData;
var hourlyData;
var dailyData;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
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
    // Navigator.push(context, MaterialPageRoute(
    //   builder: (context) {
    //     return ExpansionpanelScreen();
    //   },
    // ));
  }

  @override
  Widget build(BuildContext context) {
    final appcastURL =
        'https://raw.githubusercontent.com/ug2454/Clima/master/lib/appcast.xml';
    final cfg = AppcastConfiguration(url: appcastURL, supportedOS: ['android']);

    return Scaffold(
      body: UpgradeAlert(
        showIgnore: true,
        showLater: true,
        appcastConfig: cfg,
        debugLogging: true,
        child: Center(
          child: SpinKitCubeGrid(
            color: Color(0xFFc41a43),
            size: 100.0,
            controller: AnimationController(
              vsync: this,
              duration: const Duration(milliseconds: 1200),
            ),
          ),
        ),
      ),
    );
  }
}
