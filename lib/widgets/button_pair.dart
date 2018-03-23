import 'package:flutter/material.dart';

class FilterButtonPair extends StatefulWidget {
  @override
  _FilterButtonPair createState() => new _FilterButtonPair();
}

class _FilterButtonPair extends State<FilterButtonPair> {
  bool lSelected = true;

  static const Color SELECTED = const Color.fromRGBO(88, 170, 175, 1.0);
  static const Color NOT_SELECTED = const Color.fromRGBO(120, 97, 112, 1.0);

  Widget _button(String label, bool selected) {
    return new Expanded(
      child: new Container(
          height: 30.0,
          decoration: new BoxDecoration(
            border: new Border.all(width: 1.0, color: Colors.black38),
            borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
            color: selected ? SELECTED : NOT_SELECTED,
          ),
          child: new FlatButton(
            child: new Text(label),
            onPressed: () {
              this.setState(() {
                lSelected = !lSelected;
              });
            },
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _button("Upcoming Events", lSelected),
        new Container(
          width: 10.0,
        ), // Space
        _button("Past Events", !lSelected)
      ],
    );
  }
}
