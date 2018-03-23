import 'package:flutter/material.dart';
import 'auth/user_account.dart';
import 'dart:async';
import 'pages/index.dart';

void main() => runApp(new BrightPigApp());

class BrightPigApp extends StatefulWidget {
  BrightPigApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<BrightPigApp> with UserAccount {
  bool isSplash;
  bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    accounts = {'google': null, 'microsoft': null};
    
    // 1 second splash page
    isSplash = true;
    new Future.delayed(new Duration(seconds:1), turnSplashOff);
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
        ? new HomePage(logoutFn: performLogout)
        : new LoginPage(loginFn: performLogin);

    // initialPage = isSplash ? new SplashPage() : initialPage;
    Widget animatedStart = new AnimatedCrossFade(
      duration: const Duration(seconds: 3),
      firstChild: new SplashPage(),
      secondChild: initialPage,
      crossFadeState: isSplash ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );

    return new MaterialApp(
        title: 'BrightPig',
        home: animatedStart,
        routes: <String, WidgetBuilder>{});
  }
}
