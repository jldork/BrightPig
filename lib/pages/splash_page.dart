import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FractionallySizedBox(
        child: new Container(
          child: new Center(
              child: new Image.asset(
            'assets/images/logo.png',
            width: 256.0,
            height: 256.0,
          )),
          decoration: new BoxDecoration(color: Colors.white),
        ),
        widthFactor: 1.0,
        heightFactor: 1.0);
  }
}
