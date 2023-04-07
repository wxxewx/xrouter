import 'package:flutter/material.dart';
import 'package:router/annotation.dart';

@XRouter('main', '/main_page',
    theme: RouterTheme.Material,
    showCate: [ShowCate.Page, ShowCate.Dialog, ShowCate.BottomSheet])
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
