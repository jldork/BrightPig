import 'package:flutter/material.dart';
import '../widgets/calendar_icon.dart';
import '../constants/colors.dart';
import '../util/dates_formats.dart';
import 'package:googleapis/calendar/v3.dart' as gcal;

class FloatingStage extends StatelessWidget {
  const FloatingStage({Key key, this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      child: new Column(
        children: this.children,
      ),
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(12.0),
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(const Radius.circular(8.0)),
          color: PALE_GREY,
          boxShadow: [
            new BoxShadow(
                color: Colors.black, blurRadius: 4.0, offset: Offset(0.0, 4.0))
          ]),
    ));
  }
}

final textStyle = new TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: TEXT_GREY,
    fontFamily: 'SFPro');

final titleStyle = new TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: TITLE_PURPLE,
    fontFamily: 'SFPro');

class DetailTab extends StatelessWidget {
  DetailTab({Key key, this.tabText});
  final String tabText;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {},
        child: new Container(
          decoration: new BoxDecoration(
            gradient: accentGradient,
            boxShadow: <BoxShadow>[
              new BoxShadow(
                  color: new Color.fromRGBO(0, 0, 0, 0.5),
                  offset: new Offset(2.0, 0.0),
                  blurRadius: 4.0)
            ],
          ),
          width: 110.0,
          height: 40.0,
          child: new Center(
            child: new Text(
              tabText,
              style: new TextStyle(
                color: Colors.white,
                fontFamily: 'SFPro',
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ));
  }
}

class DetailTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: new Row(children: [
          new DetailTab(tabText: 'Attendees'),
          new DetailTab(tabText: 'Documents')
        ]));
  }
}

class EventDetails extends StatelessWidget {
  const EventDetails({Key key, this.event});
  final gcal.Event event;

  @override
  Widget build(BuildContext context) {
    String attendeeString = event.attendees == null
        ? "None"
        : event.attendees.map((attendee) => attendee.email).toList().join(", ");
    return new Row(children: <Widget>[
      new CalendarIcon(date: this.event.start.dateTime),
      new Expanded(
          child: new Container(
        padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(event.summary.toString(), style: titleStyle),
              new Text(datetimeToString(this.event.start.dateTime),
                  style: textStyle),
              new Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                  child:
                      new Text("Invitees: $attendeeString", style: textStyle))
            ]),
      ))
    ]);
  }
}

class DetailBox extends StatelessWidget {
  const DetailBox({Key key});

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new Container(
            color: Colors.white,
            child: Row(children: <Widget>[
              new Text("Skateboard gentrify edison bulb lomo fam ."),
            ],))
        );
  }
}

class EventPage extends StatelessWidget {
  const EventPage({Key key, this.event});
  final gcal.Event event;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: new Drawer(child: new ListView()),
        appBar: new AppBar(
            backgroundColor: PALE_GREY,
            actions: <Widget>[],
            centerTitle: true,
            title: new Image.asset('assets/images/logo_h.png')),
        body: new Container(
            child: new FloatingStage(children: [
              new EventDetails(event: this.event),
              new DetailTabs(),
              new DetailBox()
            ]),
            decoration: new BoxDecoration(
              color: PURPLE_GREY,
            )));
  }
}
