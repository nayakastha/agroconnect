class WeatherData {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;

  WeatherData(this.date, this.name, this.temp, this.main, this.icon);

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
        new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
            isUtc: false),
        json['name'],
        json['main']['temp'].toDouble(),
        json['weather'][0]['main'],
        json['weather'][0]['icon']);
  }
}
