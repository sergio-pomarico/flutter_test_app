import 'package:flutter/material.dart';

import 'package:flutter_testing_app/appbar.dart';

class ButtonsScreen extends StatefulWidget {
  ButtonsScreen({Key key}) : super(key: key);

  static String route = '/buttons';

  @override
  _ButtonsScreenState createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  String buttonType = 'ninguno';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('button_view'),
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              key: Key('raised_button'),
              onPressed: () {
                buttonType = 'raised_button';
                setState(() {});
              },
              child: Text('Raised Button'),
            ),
            SizedBox(height: 16),
            TextButton(
              key: Key('flat_button'),
              onPressed: () {
                buttonType = 'flat_button';
                setState(() {});
              },
              child: Text('Flat Button'),
            ),
            SizedBox(height: 16),
            IconButton(
              key: Key('icon_button'),
              onPressed: () {
                buttonType = 'icon_button';
                setState(() {});
              },
              icon: Icon(Icons.info),
            ),
            SizedBox(height: 32),
            Text(
              'Boton presionado: $buttonType',
              key: Key('text'),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
