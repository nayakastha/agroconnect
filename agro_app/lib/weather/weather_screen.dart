import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

enum AppState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Geolocator geolocator = new Geolocator();
  String key = '856822fd8e22db5e1ba48c0e7d69844a';
  WeatherFactory ws;
  List<Weather> _data = [];
  AppState _state = AppState.NOT_DOWNLOADED;
  double lat, lon;
  double lati, longi;

  @override
  void initState() {
    super.initState();
    ws = new WeatherFactory(key);
  }

  void queryForecast() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      _state = AppState.DOWNLOADING;
    });

    List<Weather> forecasts = await ws.fiveDayForecastByLocation(lat, lon);
    setState(() {
      _data = forecasts;
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  void queryWeather() async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _state = AppState.DOWNLOADING;
    });

    Weather weather = await ws.currentWeatherByLocation(lat, lon);
    setState(() {
      _data = [weather];
      _state = AppState.FINISHED_DOWNLOADING;
    });
  }

  Widget contentFinishedDownload() {
    return Center(
      child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_data[index].toString()),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget contentDownloading() {
    return Container(
        margin: EdgeInsets.all(25),
        child: Column(children: [
          Text(
            'Fetching Weather...',
            style: TextStyle(fontSize: 20),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(child: CircularProgressIndicator(strokeWidth: 10)))
        ]));
  }

  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Press the button to download the Weather forecast',
          ),
        ],
      ),
    );
  }

  Widget _resultView() => _state == AppState.FINISHED_DOWNLOADING
      ? contentFinishedDownload()
      : _state == AppState.DOWNLOADING
          ? contentDownloading()
          : contentNotDownloaded();

  void _saveLat(String input) {
    lat = double.tryParse(input);
    print(lat);
  }

  void _saveLon(String input) {
    lon = double.tryParse(input);
    print(lon);
  }

  Widget _coordinateInputs() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              margin: EdgeInsets.all(5),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter latitude',
                      hintStyle: TextStyle(color: Colors.white38)),
                  keyboardType: TextInputType.number,
                  onChanged: _saveLat,
                  onSubmitted: _saveLat)),
        ),
        Expanded(
            child: Container(
                margin: EdgeInsets.all(5),
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.white38),
                        hintText: 'Enter longitude'),
                    keyboardType: TextInputType.number,
                    onChanged: _saveLon,
                    onSubmitted: _saveLon)))
      ],
    );
  }

  bool enhance = true;
  Widget _buttons() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: RaisedButton(
            elevation: 20,
            child: Text(
              'Get co-oordinates of your place',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              /* Position _currentPosition;
              Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.best)
                  .then((Position position) {
                _currentPosition = position;
              }).catchError((e) {
                print(e);
              });
              lati = _currentPosition.latitude;
              longi = _currentPosition.longitude;
              enhance = true; */
            },
            color: Colors.green[600],
          ),
        ),
        enhance
            ? Container(child: Text("Latitude : 20.8444  Longitude : 85.1511"))
            : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              child: RaisedButton(
                elevation: 20,
                child: Text(
                  'Fetch weather',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: queryWeather,
                color: Colors.green[600],
              ),
            ),
            Container(
                margin: EdgeInsets.all(5),
                child: RaisedButton(
                  elevation: 20,
                  child: Text(
                    'Fetch forecast',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: queryForecast,
                  color: Colors.green[600],
                ))
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Weather Details'),
        ),
        body: Column(
          children: <Widget>[
            _coordinateInputs(),
            _buttons(),
            Text(
              'Output:',
              style: TextStyle(fontSize: 20),
            ),
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            Expanded(child: _resultView())
          ],
        ));
  }
}
