import 'package:flutter/material.dart';
import '../auth/user_account.dart';
import 'package:flutter/scheduler.dart';
import '../constants/colors.dart';
import '../widgets/meeting_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.logoutFn}) : super(key: key);

  final Function logoutFn;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with UserAccount {
  @override
  Widget build(BuildContext context) {
    var _children = <Widget>[
      
      new MeetingTile(
          new DateTime.now().toUtc(), "Introductory Meeting With BrightPig",
          inviteeNames: [
            "Andreas Thoma",
            "James Leung",
            "Karla Polo",
            "Michael Davis",
            "Thomas Matecki"
          ])
    
    ];

    return new Scaffold(
      drawer: new Drawer(child: new ListView()),
      appBar: new AppBar(
          backgroundColor: PALE_GREY,
          actions: <Widget>[],
          centerTitle: true,
          title: new Image.asset('assets/images/logo_h.png')),
      body: new Center(
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _children,
          ),
        ),
      ),
    );
  }
}
