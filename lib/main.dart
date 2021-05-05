import 'package:flutter/material.dart';
import 'router.dart';

import 'checkbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: UIRouter.initialRoute,
      onGenerateRoute: UIRouter.generateRoute,
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
