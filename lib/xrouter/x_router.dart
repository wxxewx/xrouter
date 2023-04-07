import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:bestrouter/page/TestPage2.dart';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'package:bestrouter/page/TestPage.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/foundation/key.dart';



class XRouter {
  static String  test2_path = '/test2'; // 
  static String  test_path = '/test'; // 



/*-------------------------------------TestPage2----------------------------------*/
  static Future openTest2Page(BuildContext context,String msg) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TestPage2(msg),
      settings: RouteSettings(name: test2_path),
    ));
  }


  static Future openTest2Dialog(BuildContext context,String msg) {
    return showDialog(
        context: context,
        builder: (context) => Dialog(child:TestPage2(msg)),
        routeSettings: RouteSettings(name: test2_path),
            );
  }


  static Future openTest2BottomSheet(BuildContext context,String msg) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => TestPage2(msg),
      routeSettings: RouteSettings(name: test2_path),
    );
  }


/*-------------------------------------TestPage----------------------------------*/
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
