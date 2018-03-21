import '../auth/google_client.dart';
import 'package:flutter/material.dart';
import '../auth/user_account.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => new _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> with UserAccount {
  void _googleLogin() async{
    await new GoogleClient().doGooglesignIn();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text("Please Log In"),
            new RaisedButton(
                child: const Text('Login with Google'), onPressed: _googleLogin)
          ],
        ),
      ),
    );
  }
}
