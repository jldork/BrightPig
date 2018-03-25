import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splash = new Container(
        child: new Center(
            child: new Image.asset(
          'assets/images/logo.png',
          width: 256.0,
          height: 256.0,
        )),
        decoration: new BoxDecoration(gradient: backgroundGradient),
        height: 512.0,
        width: 512.0);
    return splash;
  }
}
