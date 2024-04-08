import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wetter_frosch/main.dart'; 

void main() {
  testWidgets('Test der Wetter-App', (WidgetTester tester) async {
    // Build unserer App und Auslösen eines Frames.
    await tester.pumpWidget(const WetterApp());

    // Überprüfen, ob die Texte für Temperatur, gefühlte Temperatur, Tag/Nacht und Niederschlag vorhanden sind.
    expect(find.text('Temperatur: -'), findsOneWidget);
    expect(find.text('Gefühlte Temperatur: -'), findsOneWidget);
    expect(find.text('Tag/Nacht: -'), findsOneWidget);
    expect(find.text('Niederschlag: -'), findsOneWidget);

    // Tap auf den "Daten aktualisieren" Button und Auslösen eines Frames.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verifizieren, dass die Daten aktualisiert wurden.
    expect(find.text('Temperatur: -'),
        findsNothing); // Die Temperatur sollte nicht mehr "null" sein
    expect(find.text('Gefühlte Temperatur: -'),
        findsNothing); // Die gefühlte Temperatur sollte nicht mehr "null" sein
    expect(find.text('Tag/Nacht: -'),
        findsNothing); // Die Information über Tag/Nacht sollte nicht mehr "null" sein
    expect(find.text('Niederschlag: -'),
        findsNothing); // Der Niederschlag sollte nicht mehr "null" sein
  });
}
