import 'package:flutter/material.dart';
import 'package:flutter_testing_app/home.dart';

class UIRouter {
  static String initialRoute = HomeScreen.routeName;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
      HomeScreen.routeName: MaterialPageRoute<dynamic>(
        settings: RouteSettings(name: HomeScreen.routeName),
        builder: (_) => HomeScreen(),
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
