import 'package:flutter/material.dart';
import 'pages/index.dart';
import 'auth/user_account.dart';
import 'constants/colors.dart';

void main() => runApp(new BrightPigApp());

class BrightPigApp extends StatefulWidget {
  BrightPigApp({Key key, this.title}) : super(key: key);

  final String title;
  
  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<BrightPigApp> with UserAccount {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'BrightPig',
        theme: new ThemeData(
            primaryColor: PRIMARY,
            accentColor: SECONDARY,
            backgroundColor: Colors.pink,
            fontFamily: 'Barlow'),
        home: new HomePage(title: 'BrightPig'),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) =>
              new LoginPage(title: 'Please Login'),
        });
  }
}