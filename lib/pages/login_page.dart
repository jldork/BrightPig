import '../auth/google_client.dart';
import 'package:flutter/material.dart';
import '../auth/user_account.dart';
import '../widgets/primary_button.dart';

var loginGradient = new RadialGradient(
  center: const Alignment(0.0, 0.0), // centered
  radius:  5.0,
  colors: [
    const Color.fromRGBO(167, 127, 145, 0.2), // Sea 100
    const Color.fromRGBO(225, 223, 224, 1.0), // Heather 100
    // const Color.fromRGBO(221, 104, 181, 1.0) // Pale Magenta
  ],
  stops: const [0.999, 1.0],
);


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
              'images/brightpig.png', //SVG not working
              width: 128.0,
              height: 128.0,
            ),
            new PrimaryButton(
                buttonText: 'Login with Google', onClick: _googleLogin)
          ],
        ),
      ),
      decoration: new BoxDecoration(
        gradient: loginGradient,
      ),
    ));
  }
}
