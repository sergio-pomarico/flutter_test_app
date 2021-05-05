import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_testing_app/checkbox.dart';

class MyApp extends StatelessWidget {
  MyApp({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: child,
      );
}

void main() {
  //TestWidgetsFlutterBinding.ensureInitialized();

  String tittleText = 'Acepta términos y condiciones';
  bool isChecked = false;
  GlobalKey<CustomCheckboxState> key = GlobalKey<CustomCheckboxState>();

  Widget app = MyApp(
    child: CustomCheckbox(
      title: tittleText,
      isChecked: isChecked,
      key: key,
      onPress: (bool checkboxState) {
        isChecked = !checkboxState;
      },
    ),
  );

  group('Checkbox suit test > ', () {
    testWidgets('Checkbox render correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(app);

      Finder textFinder = find.text(tittleText);

      expect(textFinder, findsOneWidget);
    });

    testWidgets('checkbox updated correctly', (WidgetTester tester) async {
      await tester.pumpWidget(app);

      Finder customCheckbox = find.byType(CustomCheckbox);
      Finder checkboxFinder =
          find.descendant(of: customCheckbox, matching: find.byType(Checkbox));

      expect(checkboxFinder, findsOneWidget);
      expect(key.currentState.isOn, isFalse);

      await tester.tap(checkboxFinder);
      await tester.pump();

      expect(key.currentState.isOn, isTrue);

      //print(checkboxFinder);
    });
  });
}
