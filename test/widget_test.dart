// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_assignment/main.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Verify that the app loads with the correct title
    expect(find.text('Nidadavolu Harsha Vardhan Raju'), findsOneWidget);
    
    // Check for navigation buttons (there are 2 of each text - one in nav, one in section)
    expect(find.text('Projects'), findsNWidgets(2));
    expect(find.text('About'), findsNWidgets(2));
    expect(find.text('Skills'), findsNWidgets(2));
    expect(find.text('Contact'), findsNWidgets(2));
  });
}
