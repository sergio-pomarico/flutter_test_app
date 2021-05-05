import 'package:flutter/material.dart';
import 'package:flutter_testing_app/buttons.dart';
import 'package:flutter_testing_app/counter.dart';
import 'package:flutter_testing_app/home.dart';
import 'package:flutter_testing_app/input.dart';
import 'package:flutter_testing_app/list.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('app_bar'),
      title: Text('Flutter e2n test'),
      leading: SizedBox(),
      actions: <Widget>[
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            key: Key('dropdown'),
            icon: Icon(Icons.more_vert, color: Colors.white),
            iconSize: 16,
            elevation: 4,
            onChanged: (String route) {
              Navigator.of(context).pushReplacementNamed(route);
            },
            items: List<Map<String, String>>.from([
              {
                'name': 'Home',
                'route': HomeScreen.route,
              },
              {
                'name': 'Buttons',
                'route': ButtonsScreen.route,
              },
              {
                'name': 'Inputs',
                'route': InputsScreen.route,
              },
              {
                'name': 'Counter',
                'route': CounterScreen.route,
              },
              {
                'name': 'List',
                'route': ListsScreen.route,
              }
            ])
                .map(
                  (dynamic value) => DropdownMenuItem<String>(
                    key: Key('app_bar_item__${value["name"].toLowerCase()}'),
                    value: value['route'],
                    child: Text(value['name']),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
