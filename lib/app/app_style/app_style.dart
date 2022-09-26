import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';

class AppStyle {
  static String? fontFamily = GoogleFonts.breeSerif().fontFamily;
  static TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    letterSpacing: 1.5,
    color: kPrimary,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  static TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    letterSpacing: 1.5,
    color: kWhite,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
}
