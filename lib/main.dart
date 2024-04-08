import 'package:flutter/material.dart';
import 'package:wetter_frosch/models/weather.dart';
import 'package:wetter_frosch/repository/weather_repository.dart';

void main() {
  runApp(const WetterApp());
}

class WetterApp extends StatefulWidget {
  const WetterApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WetterAppState createState() => _WetterAppState();
}

class _WetterAppState extends State<WetterApp> {
  late WeatherRepository _repository;
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _repository = WeatherRepository();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      final weather = await _repository.fetchWeather();
      setState(() {
        _weather = weather;
      });
    } catch (error) {
      // ignore: avoid_print
      print('Fehler beim Abrufen der Wetterdaten: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wetter Frosch',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                ' ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Prien am Chiemsee',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Latitude: 47.8561, Longitude: 12.3412',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              _weather != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Temperature: ${_weather!.temperature}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Feels Like: ${_weather!.apparentTemperature}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Day/Night: ${_weather!.isDay ? 'Day' : 'Night'}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Precipitation: ${_weather!.precipitation}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchWeatherData,
                child: const Text('Vorhersage updaten'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
