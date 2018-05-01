import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';
import '../constants/colors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key, this.loginFn}) : super(key: key);

  final Function loginFn;
  // For Linkedin Login
  final flutterWebviewPlugin = new FlutterWebviewPlugin(); 
  
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
    }).then((onValue){
   
      String client_id = '77guos8d5wo4kp';
      String client_secret = 'sYfL02XUgoY7V3t9';
      String redirect_uri = 'https://us-central1-brightpig-197813.cloudfunctions.net/auth-linkedin';

      String url = "https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=${client_id}&redirect_uri=${redirect_uri}&state=987654321&scope=r_basicprofile";
      
      flutterWebviewPlugin.launch(url);


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
      ),
      height: 480.0,
      width: 320.0
    );
  }
}
