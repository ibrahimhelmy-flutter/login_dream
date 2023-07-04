import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor =Color(0xff4FA7F4);
  static const Color white = Color(0xffffffff);
  static const Color borderColor = Color(0xffD1D1D1);
  static const Color brColor = Color(0xffD88671);
  static const Color b7rColor = Color(0xff6386CC);
  static const Color brGray = Color(0xffFFF2EE);
  static const Color b7rGray = Color(0xffEEF0FF);
  static const Color blackBtn = Color(0xff1E1E1E);
  static const Color gray = Color(0xffF8F8F8);
  static const Color grayColor = Color(0xffFAFAFC);
  static Color baseColor = Colors.grey[300]!;
  static Color highlightColor = Colors.grey[200]!;

  static var boxShadowWhite = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.01),
      spreadRadius: 1,
      blurRadius: 1,
      offset: const Offset(0, 1),
    ),
  ];
  static var boxShadowBlack = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.2),
      spreadRadius: 9,
      blurRadius: 9,
      offset: const Offset(-2, 3),
    ),
  ];

  static var boxShadowBlack2 = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.1),
      spreadRadius: 9,
      blurRadius: 9,
      offset: const Offset(-2, 3),
    ),
  ];
}
