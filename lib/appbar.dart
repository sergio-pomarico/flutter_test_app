import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(30.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: Key('app_bar'),
      title: Text('Flutter e2n test'),
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
                'route': '/',
              },
              {
                'name': 'Buttons',
                'route': '/buttons',
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
