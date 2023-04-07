import 'package:bestrouter/xrouter/x_router.dart';
import 'package:flutter/material.dart';
import 'package:xrouter/annotation.dart';

@XRouterConfig('test', '/test',
    theme: RouterTheme.Material,
    showCate: [ShowCate.Page, ShowCate.Dialog, ShowCate.BottomSheet])
class TestPage extends StatelessWidget {
  const TestPage({super.key});

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
          "这是一个测试页面",
          style: TextStyle(fontSize: 25),
        )),
      ),
    );
  }
}
