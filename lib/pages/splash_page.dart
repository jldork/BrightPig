import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      child: new Center(
        child: new Image.asset('assets/img/logo-2_21.jpg',
          width: 128.0,
          height: 128.0,
        )
      ),
    );
  }
}