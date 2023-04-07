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
            Text(
              "TestPage",
              style: TextStyle(fontSize: 18),
            ),
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
            SizedBox(
              height: 50,
            ),
            Text(
              "TestPage2",
              style: TextStyle(fontSize: 18),
            ),
            TextButton(
                onPressed: () {
                  XRouter.openTest2Page(context, "Page");
                },
                child: Text("Page")),
            TextButton(
                onPressed: () {
                  XRouter.openTest2Dialog(context, "Dialog");
                },
                child: Text("Dialog")),
            TextButton(
                onPressed: () {
                  XRouter.openTest2BottomSheet(context, "bottomSheet");
                },
                child: Text("bottomSheet")),
          ],
        ),
      ),
    );
  }
}
