import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle{
  static Color bgcolor= Color(0xFFe2e2ff);
  static Color maincolor =Colors.deepOrangeAccent;
  static Color accentColor= Colors.orangeAccent;

  static List<Color> cardColor= [
    Colors.amber.shade100,
    Colors.yellow.shade100,
    Colors.pink.shade100,
    Colors.purple.shade100,
    Colors.blue.shade100,
    Colors.white70,
    Colors.grey.shade100,
    Colors.red.shade200,
  ];

  static TextStyle title=GoogleFonts.roboto(
    fontSize:18.0,
    fontWeight:FontWeight.bold
  );
  static TextStyle content=GoogleFonts.nunito(
      fontSize:15.0,
      fontWeight:FontWeight.normal
  );
  static TextStyle datetitle=GoogleFonts.roboto(
      fontSize:13.0,
      fontWeight:FontWeight.w500
  );
}