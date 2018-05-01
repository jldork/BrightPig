import 'package:flutter/material.dart';
import '../widgets/calendar_icon.dart';
import '../widgets/primary_button.dart';
import '../constants/colors.dart';
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

class EventBriefButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(children: [
      new PrimaryButton(buttonText: 'Event Brief', onClick: () {})
    ]);
  }
}

class EventDetails extends StatelessWidget {
  const EventDetails({Key key, this.event});
  final gcal.Event event;

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new CalendarIcon(date: new DateTime(1)),
      new Expanded(
          child: new Container(
        padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(event.summary.toString(),
                  style: titleStyle),
              new Text("10:00 AM | Monday, March 27th 2018", style: textStyle),
              new Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                  child: new Text("Invitees: Thomas Matecki", style: textStyle))
            ]),
      ))
    ]);
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
            child: new FloatingStage(
                children: [new EventDetails(event: this.event), new EventBriefButton()]),
            decoration: new BoxDecoration(
              color: PURPLE_GREY,
            )));
  }
}