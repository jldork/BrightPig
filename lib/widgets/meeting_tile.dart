import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CalendarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Text("TODO");
  }
}


class MeetingTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        //margin: const EdgeInsets.all(5.0),
        //color: const Color(0xFF00FF00),
        //width: 96.0,
        //height: 48.0,
        decoration: new BoxDecoration(
          //color: PALE_GREY,
          //border: new Border.all(width: 10.0, color: Colors.black38),
          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        ),
        child: new ListTile(
            leading: const Icon(Icons.flight_land),
            title: const Text('Trix\'s airplane'),
            subtitle: const Text('The airplane is only in Act II.'),
            //enabled: ,
            onTap: () {
              /* react to the tile being tapped */
            }));
  }
}
