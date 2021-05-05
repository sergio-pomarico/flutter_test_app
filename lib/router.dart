import 'package:flutter/material.dart';
import 'package:flutter_testing_app/buttons.dart';
import 'package:flutter_testing_app/counter.dart';
import 'package:flutter_testing_app/home.dart';
import 'package:flutter_testing_app/input.dart';
import 'package:flutter_testing_app/list.dart';

class UIRouter {
  static String initialRoute = HomeScreen.route;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
      HomeScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: HomeScreen.route),
        builder: (_) => HomeScreen(),
      ),
      CounterScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: CounterScreen.route),
        builder: (_) => CounterScreen(),
      ),
      ButtonsScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: ButtonsScreen.route),
        builder: (_) => ButtonsScreen(),
      ),
      InputsScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: InputsScreen.route),
        builder: (_) => InputsScreen(),
      ),
      ListsScreen.route: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: ListsScreen.route),
        builder: (_) => ListsScreen(),
      ),
    };

    return appRouting[settings.name] ??
        MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
  }
}
