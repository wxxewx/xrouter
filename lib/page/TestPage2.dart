import 'package:bestrouter/xrouter/x_router.dart';
import 'package:flutter/material.dart';
import 'package:xrouter/annotation.dart';

@XRouterConfig('test2', '/test2',
    showCate: [ShowCate.Page, ShowCate.Dialog, ShowCate.BottomSheet])
class TestPage2 extends StatelessWidget {
  final String msg;

  const TestPage2(this.msg);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              XRouter.back(context);
            },
          ),
        ),
        body: Center(
            child: Text(
          "这是一个测试页面,参数:$msg",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
        )),
      ),
    );
  }
}
