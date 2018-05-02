// App Colors
import 'package:flutter/material.dart';

const Color DUSTY_LAVENDER = const Color.fromRGBO(209, 187, 197, 1.0);
const Color PALE_GREY = const Color.fromRGBO(239, 237, 238, 1.0);
const Color SEA_GREEN = const Color.fromRGBO(59, 162, 169, 1.0);
const Color HEATHER = const Color.fromRGBO(161, 126, 176, 1.0);
const Color PURPLE_GREY = const Color.fromRGBO(119, 100, 106, 1.0);
const Color TITLE_PURPLE = const Color.fromRGBO(126, 35, 93, 1.0);
const Color TEXT_GREY = const Color.fromRGBO(81, 81, 81, 1.0);

var backgroundGradient = new RadialGradient(
  center: const Alignment(0.0, 0.0), // centered
  radius: 50.0,
  colors: [DUSTY_LAVENDER, PALE_GREY],
  stops: const [0.5, 1.0],
);

var accentGradient = new RadialGradient(
  center: const Alignment(0.0, 0.0), // near the top right
  radius: 5.0,
  colors: [SEA_GREEN, HEATHER],
  stops: const [0.1, 1.0],
);
