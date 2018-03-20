import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BrightPig',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'BrightPig'),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) =>
            new MyLoginPage(title: 'Please Login'),
      }
    );
  }
}
