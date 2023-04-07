import 'package:bestrouter/page.dart';
import 'package:flutter/material.dart';

class Router {
  static String main_path = '/main_page';

  Future openMainPage(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MainPage(),
      settings: RouteSettings(name: main_path),
    ));
  }

  Future openMainDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => MainPage(),
      routeSettings: RouteSettings(name: main_path),
    );
  }

  Future openMainBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => MainPage(),
      routeSettings: RouteSettings(name: main_path),
    );
  }
}
