import 'weathermodel.dart';

class ForecastData {
  final List list;

  ForecastData(this.list);

  factory ForecastData.fronJson(Map<String, dynamic> json) {
    List list = new List();
    for (dynamic e in json['list']) {
      WeatherData w = new WeatherData(
          new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
              isUtc: false),
          e['city']['name'],
          e['main']['temp'].toDouble(),
          e['weather'][0]['main'],
          e['weather'][0]['icon']);
      list.add(w);
    }

    return ForecastData(list);
  }
}
