import 'package:flutter/material.dart';

import 'package:flutter_testing_app/appbar.dart';

class ListsScreen extends StatefulWidget {
  ListsScreen({Key key}) : super(key: key);

  static String route = '/lists';

  @override
  _ListsScreenState createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: Key('list_view'),
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: ListView.separated(
          key: Key('test_list'),
          padding: EdgeInsets.symmetric(horizontal: 32),
          itemBuilder: (context, index) {
            return Container(
              key: Key('item_$index'),
              height: 80,
              width: size.width,
              alignment: Alignment.center,
              child: Text('Item ${index + 1}'),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 16);
          },
          itemCount: 30,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
