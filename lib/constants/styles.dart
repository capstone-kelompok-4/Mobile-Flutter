import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF007FFE);
const Color secondaryColor = Color(0xFFFF6C00);
Color grey600 = Colors.grey[600]!;
Color grey500 = Colors.grey[500]!;
Color grey400 = Colors.grey[400]!;
Color grey300 = Colors.grey[300]!;
Color grey200 = Colors.grey[200]!;

const Color colorBlueLight2 = Color(0xFFF7F7FC);
const Color colorBlueLight = Color(0xFFF0F5FD);
const Color colorBlueDark = Color(0xFF133461);
const Color colorTextBlue = Color(0xFF133461);
const Color colorBgCourse = Color(0xFFD6DEEC);
const Color inactiveMenu = Color(0xFF133461);
const Color colorOrange = Color(0xFFFF6C00);
const Color colorOrangeLight = Color(0xFFFFCEAA);
const Color colorGrey = Color(0xFF9EA4AA);

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.white,
  textTheme: myTextTheme,
  appBarTheme: const AppBarTheme(
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: secondaryColor,
      textStyle: const TextStyle(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(0),
        ),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: secondaryColor,
    unselectedItemColor: Colors.grey,
  ),
);

final myTextTheme = TextTheme(
  headline1: GoogleFonts.mulish(fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.mulish(fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.mulish(fontSize: 46, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.mulish(fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.mulish(fontSize: 23, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.mulish(fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
