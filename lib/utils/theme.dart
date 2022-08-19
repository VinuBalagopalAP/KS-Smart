import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// [ App Themes ]

class KsSmartTheme {
  /// [ Colors ]

  static const Color appBarColor = Color(0xFF656880);
  static const Color lightBg = Color(0xFFF4F4F8);
  static const Color yellowish = Color(0xFFFFC87E);
  static const Color greish = Color(0x6B708C1F);
  static const Color lightGrey = Color(0xFFD3D3D3);
  static const Color footerColor = Color(0xFF3F4250);
  static Color whitishGrey = const Color(0xFF2D2522).withOpacity(0.1);
  static const Color lightBlack = Color(0xFF36394f);
  static const Color dotWhiteColor = Colors.white38;

  static const Color primaryColor = Colors.white;
  static const Color secondaryColor = Color(0xFF2D2522);
  static const Color authBlue = Color(0xFF0161DC);
  static const Color black = Colors.black;

  /// [ Theme properties ]

  static ThemeData get theme => ThemeData(
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
        textTheme: TextTheme(
          headline3: GoogleFonts.notoSans(
            fontSize: 35,
            color: KsSmartTheme.primaryColor,
          ),
          headline6: GoogleFonts.poppins(
            fontSize: 20,
            color: KsSmartTheme.lightBlack,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: GoogleFonts.poppins(
            fontSize: 16,
            color: KsSmartTheme.primaryColor,
          ),
          bodyText2: GoogleFonts.poppins(
            fontSize: 14,
            color: KsSmartTheme.lightBlack,
          ),
        ),
        appBarTheme: AppBarTheme(
          toolbarTextStyle: GoogleFonts.poppins(),
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: KsSmartTheme.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
        ),
        scaffoldBackgroundColor: KsSmartTheme.lightBg,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          foregroundColor: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          splashColor: secondaryColor.withAlpha(40),
        ),
      );
}
