import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme(BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamcolor,
      buttonColor: cdarkbluishcolor,
      accentColor: cdarkbluishcolor,
      focusColor: cdarkbluishcolor,
      shadowColor: Colors.white12,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: Theme.of(context).textTheme);

  // ignore: non_constant_identifier_names
  static ThemeData DarkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkcreamcolor,
      buttonColor: lightbluishcolor,
      accentColor: Colors.white,
      focusColor: Vx.indigo500,
      shadowColor: Vx.gray800,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: Theme.of(context).textTheme);

  //colors
  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkcreamcolor = Vx.gray900;
  static Color cdarkbluishcolor = Color(0xff403b58);
  static Color lightbluishcolor = Vx.indigo500;
}
