import 'package:bestrouter/xrouter/x_router.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  XRouter.openTestPage(context);
                },
                child: Text("Page")),
            TextButton(
                onPressed: () {
                  XRouter.openTestDialog(context);
                },
                child: Text("Dialog")),
            TextButton(
                onPressed: () {
                  XRouter.openTestBottomSheet(context);
                },
                child: Text("bottomSheet")),
          ],
        ),
      ),
    );
  }
}
