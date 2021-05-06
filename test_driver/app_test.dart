import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

Directory directory;
Future<void> main() async {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
    directory = Directory('test_driver/screenshot');
    await directory.create(recursive: true);
  });

  tearDownAll(() async {
    if (driver != null) await driver.close();
  });

  Future<void> takeScreenshot(String fileName, FlutterDriver driver) async {
    String path = p.join(directory.path, fileName);
    List<int> pixels = await driver.screenshot();
    File file = File(path);
    await file.writeAsBytes(pixels);
  }

  Future<void> generateTimeLineReport(Timeline timeline, String test) async {
    final summary = TimelineSummary.summarize(timeline);
    await summary.writeTimelineToFile(
      '${test}_sumary',
      pretty: true,
    );
    await summary.writeTimelineToFile(
      '${test}_sumary',
      pretty: true,
    );
  }

  group('Home Page', () {
    test('> render it\'s ok', () async {
      Future.delayed(Duration(seconds: 1));
      await driver.waitFor(find.byValueKey('main_text'));
      await driver.waitFor(find.byValueKey('home_view'));
      await driver.waitFor(find.byType('Text'));
      await takeScreenshot('home_view.png', driver);
    });
    test('> Navigate to input page', () async {
      Future.delayed(Duration(seconds: 1));
      await driver.waitFor(find.byValueKey('app_bar'));
      await driver.tap(find.byValueKey('dropdown'));
      await driver.tap(find.byValueKey('app_bar_item__inputs'));
      await driver.waitFor(find.byValueKey('input_view'));
    });
  });

  group('Input page', () {
    test('> render it\'s ok', () async {
      Future.delayed(Duration(seconds: 1));
      await driver.waitFor(find.byValueKey('input_view'));
      await driver.waitFor(find.byValueKey('input_1'));
      await driver.waitFor(find.byValueKey('input_2'));
      await takeScreenshot('input_view.png', driver);
    });

    test('> [input_1] typing...', () async {
      Future.delayed(Duration(seconds: 1));
      final SerializableFinder input = find.byValueKey('input_1');

      final timeline = await driver.traceAction(() async {
        await driver.tap(input);
        await Future.delayed(Duration(seconds: 1));
        await driver.enterText('My name is Sergio');
      });
      await takeScreenshot('[input_view]input_1_typing.png', driver);
      await generateTimeLineReport(timeline, 'input_1 typing');
    });

    test('> [input_2] typing...', () async {
      Future.delayed(Duration(seconds: 1));
      final SerializableFinder input = find.byValueKey('input_2');

      final timeline = await driver.traceAction(() async {
        await driver.tap(input);
        await Future.delayed(Duration(seconds: 1));
        await driver.enterText('25');
      });
      await takeScreenshot('[input_view]input_2_typing.png', driver);
      await generateTimeLineReport(timeline, 'input_2 typing');
    });

    test('> navigate to Button page', () async {
      Future.delayed(Duration(seconds: 1));
      await driver.waitFor(find.byValueKey('app_bar'));
      await driver.tap(find.byValueKey('dropdown'));
      await Future.delayed(Duration(milliseconds: 500));
      await driver.tap(find.byValueKey('app_bar_item__buttons'));
      await driver.waitFor(find.byValueKey('button_view'));

      await takeScreenshot('button_view.png', driver);
    });
  });
}
