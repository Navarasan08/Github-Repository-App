

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repos/src/views/screens.dart';

class AppRouter {
  static const String home = '/';

  static Route<MaterialPageRoute> generateRoute(RouteSettings settings) {

    switch(settings.name) {

      case home:
        return MaterialPageRoute(
          settings: RouteSettings(name: "/homePage"),
          builder: (_) => HomePage(),
        );
        break;

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));

    }

  }

}