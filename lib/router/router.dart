import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:bestrouter/page.dart';



class Router {
static String  main_page = '/main_page'; // 



  Future openMainPage(BuildContext context) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MainPage(),
      settings: RouteSettings(name: main_page),
    ));
  }
  Future openMainDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => MainPage(),
        routeSettings: RouteSettings(name: main_page),
            );
  }
  Future openMainBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => MainPage(),
      routeSettings: RouteSettings(name: main_page),
    );
  }

}
