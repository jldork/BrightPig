import 'package:flutter/material.dart';
import 'auth/user_account.dart';
import 'dart:async';
import 'pages/index.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(new BrightPigApp());

class BrightPigApp extends StatefulWidget {
  BrightPigApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<BrightPigApp> {
  bool isSplash;
  bool isLoggedIn;
  Map<String, GoogleSignInAccount> accounts;

  @override
  void initState() {
    super.initState();
    accounts = {'google': null};

    isSplash = true;
    new Future.delayed(new Duration(seconds: 1), turnSplashOff);
  }

  void turnSplashOff() {
    setState(() => isSplash = false);
  }

  void performLogin(account, provider) {
    setState(() {
      accounts[provider] = account;
    });
  }

  void performLogout() {
    setState(() {
      accounts.forEach((provider, account) {
        accounts[provider] = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = accounts.values.any((account) {
      return account != null;
    });

    var initialPage = isLoggedIn
        ? new UserAccount(
            accounts: accounts, 
            child: new HomePage(logoutFn: performLogout)
            )
        : new LoginPage(loginFn: performLogin);

    Widget animatedStart = new AnimatedCrossFade(
        duration: const Duration(seconds: 3),
        firstChild: new SplashPage(),
        secondChild: initialPage,
        crossFadeState:
            isSplash ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstCurve: Curves.fastOutSlowIn);

    return new MaterialApp(
        title: 'BrightPig',
        home: animatedStart,
        routes: <String, WidgetBuilder>{});
  }
}
