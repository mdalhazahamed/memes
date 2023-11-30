import 'package:flutter/material.dart';
import 'package:get_memes/feature/home/presentation/pages/details_page.dart';
import 'package:get_memes/feature/home/presentation/pages/home_page.dart';
import 'routing_variables.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case Navigation.homePage:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Navigation.detailsPage:
        return MaterialPageRoute(builder: (_) => DetailsPage(aruments: args));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
