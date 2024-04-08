class Weather {
  final double temperature;
  final double apparentTemperature;
  final bool isDay;
  final double precipitation;

  Weather({
    required this.temperature,
    required this.apparentTemperature,
    required this.isDay,
    required this.precipitation,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['temperature_2m'].toDouble(),
      apparentTemperature: json['apparent_temperature'].toDouble(),
      isDay: json['is_day'] == 1,
      precipitation: json['precipitation'].toDouble(),
    );
  }
}
