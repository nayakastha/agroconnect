import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weathermodel.dart';

class WeatherItem extends StatelessWidget {
  final WeatherData weather;
  const WeatherItem({Key key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(weather.name),
            Text(
              weather.main,
              style: TextStyle(fontSize: 32.0),
            ),
            Text('${weather.temp.toString()}°F'),
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
            Text(new DateFormat.yMMMd().format(weather.date)),
            Text(new DateFormat.Hm().format(weather.date))
          ],
        ),
      ),
    );
  }
}
