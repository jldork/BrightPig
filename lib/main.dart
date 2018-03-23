import 'package:flutter/material.dart';
import 'auth/user_account.dart';
import 'dart:async';
import 'pages/index.dart';
import 'auth/google_client.dart';

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
  UserAccount user = new UserAccount();
  
  @override
  void initState() {
    super.initState();
    user.accounts = {'google': null, 'microsoft': null};

    // 1 second splash page
    isSplash = true;
    new Future.delayed(new Duration(seconds: 1), turnSplashOff);
  }

  void turnSplashOff() {
    setState(() => isSplash = false);
  }

  void performLogin(account, provider) {
    setState(() {
      user.accounts[provider] = account;
      switch (provider) {
        case 'google':
          user.googleClient = new GoogleClient(user.accounts['google']);
          user.googleClient.getApis();
          break;
      }
    });
  }

  void performLogout() {
    setState(() {
      user.accounts.forEach((provider, account) {
        user.accounts[provider] = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = user.accounts.values.any((account) {
      return account != null;
    });
    var initialPage = isLoggedIn
        ? new HomePage(user: user, logoutFn: performLogout)
        : new LoginPage(loginFn: performLogin);

    // initialPage = isSplash ? new SplashPage() : initialPage;
    Widget animatedStart = new AnimatedCrossFade(
      duration: const Duration(seconds: 3),
      firstChild: new SplashPage(),
      secondChild: initialPage,
      crossFadeState:
          isSplash ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );

    return new MaterialApp(
        title: 'BrightPig',
        home: animatedStart,
        routes: <String, WidgetBuilder>{});
  }
}
