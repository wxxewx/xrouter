import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:bestrouter/TestPage.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/foundation/key.dart';



class XRouter {
  static String  test_path = '/test'; // 



  static Future openTestPage(BuildContext context,{Key? key}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TestPage(key:key),
      settings: RouteSettings(name: test_path),
    ));
  }
  static Future openTestDialog(BuildContext context,{Key? key}) {
    return showDialog(
        context: context,
        builder: (context) => Dialog(child:TestPage(key:key)),
        routeSettings: RouteSettings(name: test_path),
            );
  }
  static Future openTestBottomSheet(BuildContext context,{Key? key}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => TestPage(key:key),
      routeSettings: RouteSettings(name: test_path),
    );
  }
  static back(BuildContext context) {
    Navigator.pop(context);
  }

}
