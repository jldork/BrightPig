import '../auth/google_client.dart';
import 'package:flutter/material.dart';
import '../auth/user_account.dart';
import '../widgets/primary_button.dart';
import '../constants/colors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPageState createState() => new _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> with UserAccount {
  void _googleLogin() async {
    await new GoogleClient().doGooglesignIn();
    Navigator.of(context).pop();
  }
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Image.asset(
              'assets/images/logo.png',
              width: 256.0,
              height: 256.0,
            ),
            new PrimaryButton(
                buttonText: 'Login with Google', onClick: _googleLogin)
          ],
        ),
      ),
      decoration: new BoxDecoration(
        gradient: backgroundGradient,
      ),
    ));
  }
}
