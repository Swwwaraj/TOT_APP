import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tot_app/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen has a title and button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Verify that the title is displayed.
    expect(find.text('TOT APP'), findsOneWidget);

    // Verify that a button is displayed.
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
