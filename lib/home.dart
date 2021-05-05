import 'package:flutter/material.dart';
import 'package:flutter_testing_app/appbar.dart';

class HomeScreen extends StatefulWidget {
  static String route = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text(
          'Flutter testing',
          key: Key('main_text'),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
