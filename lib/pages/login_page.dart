import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../constants/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key, this.loginFn}) : super(key: key);

  final Function loginFn;
  
  static GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      "https://www.googleapis.com/auth/calendar",
      "https://mail.google.com/",
    ],
  );

  void _googleLogin() async {
    await _googleSignIn.signIn().then((account){
      loginFn(account, 'google');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
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
      )
    );
  }
}
