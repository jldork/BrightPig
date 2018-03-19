import 'package:flutter/material.dart';
import '../google_client.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => new _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  static GoogleClient _client;

  @override
  void initState() {}

  void _login() {
    setState(() {
      _client = new GoogleClient();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text("Please Log In"),
            new RaisedButton(
                child: const Text('Login with Google'), onPressed: _login)
          ],
        ),
      ),
    );
  }
}
