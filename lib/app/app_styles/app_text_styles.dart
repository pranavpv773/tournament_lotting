import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static String? fontFamily = GoogleFonts.breeSerif().fontFamily;

  static TextStyle h1 = TextStyle(
    fontFamily: GoogleFonts.sofia().fontFamily,
    letterSpacing: 1.5,
    color: Colors.pink[900],
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  static TextStyle h2 = TextStyle(
    fontFamily: GoogleFonts.trirong().fontFamily,
    letterSpacing: 2,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle headings = TextStyle(
    color: AppColors.primary1,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 1,
    fontFamily: GoogleFonts.radley().fontFamily,
  );
  static TextStyle formField = TextStyle(
    color: AppColors.kBlack,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    color: Colors.grey,
    fontSize: 16,
  );

  static TextStyle h4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );

  static TextStyle h5 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    color: AppColors.primary1,
    fontWeight: FontWeight.w500,
  );

  static TextStyle buttonText = TextStyle(
      fontFamily: GoogleFonts.abel().fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 2);

  static TextStyle numStyle = TextStyle(
    fontSize: 16,
    fontFamily: GoogleFonts.notoSansSymbols().fontFamily,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodyLg = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  static TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 10,
  );
  static TextStyle currency = const TextStyle(
    fontSize: 16,
    color: Colors.green,
  );
}
