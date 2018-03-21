import 'package:flutter/material.dart';
import '../auth/user_account.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with UserAccount {
  @override
  void initState() {
    super.initState();

    if (!isLoggedIn) {
      print("not logged in, going to login page");
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushNamed("/login");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('HOMEPAGE'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text("TESTING HOME PAGE"),
          ],
        ),
      ),
    );
  }
}
