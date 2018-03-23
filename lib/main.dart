import 'package:flutter/material.dart';
import 'pages/index.dart';

void main() => runApp(new BrightPigApp());

class BrightPigApp extends StatefulWidget {
  BrightPigApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppState createState() => new _AppState();
}

class _AppState extends State<BrightPigApp>{
  var accounts = {'google': null, 'microsoft': null};
  
  @override
  void initState() {
    super.initState();
  }

  void performLogin(account, provider) {
    setState(() {
      accounts[provider] = account;
    });
  }

  void performLogout() {
    setState(() {
      accounts.forEach((provider, account){
        accounts[provider] = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = accounts.values.any((account){
      return account != null;
    });
    var initialPage = isLoggedIn
        ? new HomePage(logoutFn: performLogout)
        : new LoginPage(loginFn: performLogin);
    return new MaterialApp(
        title: 'BrightPig',
        home: initialPage,
        routes: <String, WidgetBuilder>{});
  }
}
