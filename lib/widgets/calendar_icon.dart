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