import 'package:flutter/material.dart';

abstract class MyColors {
  static const Color light = Color(0xffe5dfe5);
  static const Color dark = Color(0xff020b10);
  static const Color accent = Color(0xff182631);
  static const Color accent2 = Color(0xff3E4A57);
  static const Color error = Color(0xff681b2b);
}

abstract class MyTextStyles {
  static const TextStyle title = TextStyle(
    color: MyColors.light,
    fontFamily: 'Doctor Glitch',
  );
  static const TextStyle sectionTitle = TextStyle(
    color: MyColors.light,
    fontSize: 50,
  );
  static const TextStyle selectionMenuCard = TextStyle(
    color: MyColors.light,
    fontSize: 40,
  );
  static const TextStyle info = TextStyle(
    color: MyColors.light,
    fontSize: 25,
  );
  static const TextStyle chip = TextStyle(
    color: MyColors.dark,
    fontSize: 20,
  );
  static const TextStyle error = TextStyle(
    color: MyColors.error,
    fontSize: 20,
  );
}

abstract class MyPaddings {
  static const double verySmall = 5;
  static const double small = 10;
  static const double large = 20;
  static const double veryLarge = 50;
}

abstract class MyBorderRadius {
  static const double normal = 20;
}
