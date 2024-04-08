import 'package:flutter/material.dart';

const jsonString = """
{
    "latitude": 48.78,
    "longitude": 9.18,
    "current": {
        "time": "2024-01-12T11:45",
        "temperature_2m": -3.6,
        "apparent_temperature": -7.0,
        "is_day": 1,
        "precipitation": 12.00
    }
}
""";

class WetterApp extends StatefulWidget {
  const WetterApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WetterAppState createState() => _WetterAppState();
}

class _WetterAppState extends State<WetterApp> {
  double? temperatur;
  double? gefuehlteTemperatur;
  bool? istTag;
  double? niederschlag;

  void _datenAktualisieren() {
    // Methode implementieren, um die Daten aus JSON zu holen und zu setzen
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wetter Frosch'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Temperatur: ${temperatur ?? '-'}'),
              Text('Gefühlte Temperatur: ${gefuehlteTemperatur ?? '-'}'),
              Text('Tag/Nacht: ${istTag ?? '-'}'),
              Text('Niederschlag: ${niederschlag ?? '-'}'),
              ElevatedButton(
                onPressed: _datenAktualisieren,
                child: const Text('Daten aktualisieren'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
