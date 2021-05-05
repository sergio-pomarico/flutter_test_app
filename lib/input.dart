import 'package:flutter/material.dart';
import 'package:flutter_testing_app/appbar.dart';

class InputsScreen extends StatefulWidget {
  InputsScreen({Key key}) : super(key: key);

  static String route = '/inputs';

  @override
  _InputsScreenState createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('input_view'),
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              key: Key('input_1'),
              focusNode: node1,
              onTap: () {
                node2.unfocus();
                node1.requestFocus();
              },
              onSubmitted: (String v) {
                node1.unfocus();
              },
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            SizedBox(height: 32.0),
            TextField(
              key: Key('input_2'),
              onTap: () {
                node1.unfocus();
                node2.requestFocus();
              },
              onSubmitted: (String v) {
                node2.unfocus();
              },
              focusNode: node2,
              decoration: InputDecoration(labelText: 'Edad'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
