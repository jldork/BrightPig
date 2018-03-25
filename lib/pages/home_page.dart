import 'package:flutter/material.dart';
import '../auth/user_account.dart';
import '../constants/colors.dart';
import '../widgets/meeting_tile.dart';
import '../widgets/button_pair.dart';

class HomePage extends StatefulWidget {
  final Function logoutFn;
  HomePage({Key key, this.logoutFn}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState(logoutFn);
}


class _MyHomePageState extends State<HomePage> {
  final Function logoutFn;

  _MyHomePageState(this.logoutFn);

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    print("\n\n");
    print("INITIALIZING HOME_PAGE STATE");
    print(UserAccount.of(context).accounts);
    print("\n\n");

    var _meetingTiles = <Widget>[
      new MeetingTile(
          new DateTime.now().toUtc(), "Introductory Meeting With BrightPig",
          inviteeNames: [
            "Andreas Thoma",
            "James Leung",
            "Karla Polo",
            "Michael Davis",
            "Thomas Matecki"
          ]),
      new MeetingTile(new DateTime.now().toUtc(), "BrightPig User Feedback",
          inviteeNames: ["Ola Gamberi"])
    ];

    Scaffold homepageScaffold = new Scaffold(
      drawer: new Drawer(child: new ListView()),
      appBar: new AppBar(
          backgroundColor: PALE_GREY,
          actions: <Widget>[],
          centerTitle: true,
          title: new Image.asset('assets/images/logo_h.png')),
      body: new Container(
        padding: const EdgeInsets.all(8.0),
        color: const Color.fromRGBO(119, 100, 106, 1.0),
        child: new Column(
          children: <Widget>[
            new FilterButtonPair(),
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _meetingTiles,
            )
          ],
        ),
      ),
    );
  
  return new Container(child: homepageScaffold, height:480.0, width:320.0);
  }
}
