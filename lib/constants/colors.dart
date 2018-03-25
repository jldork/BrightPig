// App Colors
import 'package:flutter/material.dart';

const Color DUSTY_LAVENDER = const Color.fromRGBO(209, 187, 197, 1.0);
const Color PALE_GREY = const Color.fromRGBO(225, 223, 224, 1.0);
const Color SEA_GREEN = const Color.fromRGBO(59, 162, 169, 1.0);
const Color HEATHER = const Color.fromRGBO(161, 126, 176, 1.0);

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
