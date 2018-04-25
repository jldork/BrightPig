import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/meeting_tile.dart';
import '../widgets/button_pair.dart';
import '../auth/google_client.dart';
import '../auth/user_account.dart';
import 'package:googleapis/calendar/v3.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  final Function logoutFn;
  HomePage({Key key, this.logoutFn}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState(logoutFn);
}

class _MyHomePageState extends State<HomePage> {
  final Function logoutFn;
  _MyHomePageState(this.logoutFn);

  CalendarApi calendarApi;
  // PeopleApi peopleApi;
  List<Widget> _meetings;

  void initState() {
    super.initState();
    _meetings = <Widget>[
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
  }

  Future<Null> _getApis(googleSignInAccount) async {
    // Unfortunately, the build function completes before this
    Future<Map<String, String>> futureHeaders = googleSignInAccount.authHeaders;
    Map<String, String> headers = await futureHeaders;
    final httpClient = new GoogleHttpClient(headers);
    this.calendarApi = new CalendarApi(httpClient);
  }

  Future<Events> _getCalendarEvents() async {
    Events dataFuture = await calendarApi.events.list("primary",
        singleEvents: true,
        orderBy: 'startTime',
        maxResults: 10,
        timeMin: new DateTime.now().toUtc());
    return dataFuture;
  }

  Widget _buildMeetingTile(Event event){
    return new MeetingTile(
      event.start.dateTime,
      event.summary

    );
  }

  @override
  Widget build(BuildContext context) {
    var googleSignInAccount = UserAccount.of(context).accounts['google'];
    _getApis(googleSignInAccount).then((none) {
      print("APIS received");
      _getCalendarEvents().then((data) {
        print("**********************************************************");
        print("----------------------------------------------------------");
        List<Event> eventsData = data.items;
        print(eventsData);

        print("----------------------------------------------------------");
        print("**********************************************************");
      });

    });

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
              children: _meetings,
            )
          ],
        ),
      ),
    );

    return new Container(child: homepageScaffold, height: 480.0, width: 320.0);
  }
}
