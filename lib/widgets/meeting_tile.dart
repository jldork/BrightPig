import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../util/dates_formats.dart';
import 'calendar_icon.dart';
import 'package:googleapis/calendar/v3.dart' as gcal; 

class MeetingTile extends StatelessWidget {
  final gcal.Event event;
  MeetingTile(gcal.Event event): event = event;

  /// Format the list a invitees nicely
  String get inviteeString {
    if (event.attendees == null || event.attendees.length == 0){
      return "";
    } else if (event.attendees.length == 1) {
      return "Invitee: " + event.attendees.toString();
      // map((attendee) => attendee.toString()).toList()
    } else {
      return "Invitees: " + event.attendees.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("**************************************");
    print("Title: ${event.summary}");
    print("Attendees: ${event.attendees}");
    print("DateTime: ${event.start.dateTime}");
    print("**************************************");
    return new Container(
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, .0),
      padding: const EdgeInsets.fromLTRB(12.0, 20.0, 20.0, 12.0),
      decoration: new BoxDecoration(
        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black38,
              offset: new Offset(0.0, 2.0),
              blurRadius: 4.0)
        ],
      ),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new CalendarIcon(date: event.start.dateTime),
          new Expanded(
              child: new Container(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(event.summary.toString(),
                      style: new TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(126, 35, 93, 1.0))),
                  new Text(new PrettyDateTime(event.start.dateTime).toString()),
                  new Container(
                      margin: const EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
                      child: new Text(this.inviteeString))
                ]),
          )),
        ],
      ),
    );
  }
}
