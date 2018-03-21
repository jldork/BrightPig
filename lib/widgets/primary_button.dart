import 'package:flutter/material.dart';

var gradient = new RadialGradient(
  center: const Alignment(0.0, 0.0), // near the top right
  radius:  5.0,
  colors: [
    const Color.fromRGBO(59, 162, 169, 1.0), // Sea 100
    const Color.fromRGBO(161, 126, 176, 1.0), // Heather 100
    // const Color.fromRGBO(221, 104, 181, 1.0) // Pale Magenta
  ],
  stops: const [0.1, 1.0],
);

var textStyle = new TextStyle(
  color: Colors.white,
  fontFamily: 'SFProDisplay-Regular',
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
);

class PrimaryButton extends StatelessWidget {
  final Function onClick;
  final Color backgroundColor;
  final Color fontColor;
  final String buttonText;
  final Gradient buttonGradient;
  final double width;
  final double height;

  final fontSize;
  final fontWeight;

  PrimaryButton(
      {this.onClick,
      this.backgroundColor,
      this.buttonGradient,
      this.fontColor: Colors.white,
      this.buttonText,
      this.width: 258.0,
      this.height: 48.0,
      this.fontSize: 18.0,
      this.fontWeight: FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: onClick,
        child: new Container(
          decoration: new BoxDecoration(
            gradient: gradient,
            borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                  color: new Color.fromRGBO(0, 0, 0, 0.5),
                  offset: new Offset(0.0, 2.0),
                  blurRadius: 4.0)
            ],
            // color: backgroundColor
          ),
          width: width,
          height: height,
          child: new Center(
            child: new Text(
              buttonText,
              style: textStyle,
            ),
          ),
        ));
  }
}
