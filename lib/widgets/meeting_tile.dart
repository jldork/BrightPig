import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../util/dates_formats.dart';

class CalendarIcon extends StatelessWidget {
  const CalendarIcon({Key key, this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 70.0,
      height: 70.0,
      padding: const EdgeInsets.fromLTRB(9.0, 5.0, 9.0, 3.0),
      //margin: const EdgeInsets.all(2.0),
      decoration: new BoxDecoration(
        border: new Border.all(width: 1.0, color: Colors.black38),
        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black38,
              offset: new Offset(0.0, 2.0),
              blurRadius: 4.0)
        ],
      ),
      child: new Column(
        children: <Widget>[
          new Text(
            '${TextConversions.monthAbbrev[this.date.month]}',
            style: new TextStyle(
                fontSize: 12.0, color: const Color.fromRGBO(141, 32, 101, 1.0)),
          ),
          new Text(
            "${this.date.day}",
            style: new TextStyle(
              fontSize: 36.0,
            ),
          )
        ],
      ),
    );
  }
}

class MeetingTile extends StatelessWidget {
  final DateTime dateTime;
  final String title;
  final List<String> inviteeNames;

  MeetingTile(DateTime dateTime, String title, {List<String> inviteeNames})
      : dateTime = dateTime,
        title = title,
        inviteeNames = inviteeNames;

  String get inviteeString {
    return (this.inviteeNames == null || this.inviteeNames.length == 0)
        ? ""
        : inviteeNames.reduce((i1, i2) {
            return "$i1, $i2";
          });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
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
        children: <Widget>[
          new CalendarIcon(date: dateTime),
          new Container(
            padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("Introductory Meeting With BrightPig",
                      style: new TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(126, 35, 93, 1.0))),
                  new Text(new PrettyDateTime(dateTime).toString()),
                  new Text(
                    this.inviteeString,
                    
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
