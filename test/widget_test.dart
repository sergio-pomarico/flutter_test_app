// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_testing_app/main.dart';

void main() {
  group('Counter app suit test >', () {
    testWidgets('Counter render correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // find widget by key
      Key counterkey = Key('counter_text');
      Finder counterTextFinder = find.byKey(counterkey);

      //find widget by text
      String counterText = '0';
      Finder counterTextFinderByText = find.text(counterText);

      // Tap the '+' icon and trigger a frame.
      // await tester.tap(find.byIcon(Icons.add));

      // Verify that our counter has incremented.
      // expect(find.text('0'), findsNothing);
      // expect(find.text('1'), findsOneWidget);
      expect(counterTextFinder, findsOneWidget);
      expect(counterTextFinderByText, findsOneWidget);
    });

    testWidgets('view updated correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      //Find by type
      Finder counterButton = find.byType(FloatingActionButton);

      //Tap button
      await tester.tap(counterButton);
      await tester.pump();

      //find widget by text
      String counterText = '1';
      Finder counterTextFinderByText = find.text(counterText);

      expect(counterTextFinderByText, findsOneWidget);
    });
  });
}
