import 'package:flutter/material.dart';
import 'package:flutter_ui_chat/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: mPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: mContentColorLightTheme),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: kContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: mPrimaryColor,
      secondary: mSecondaryColor,
      error: mErrorColor,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: mPrimaryColor,
    scaffoldBackgroundColor: mContentColorLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: IconThemeData(color: mContentColorDarkTheme),
    // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
    //     .apply(bodyColor: kContentColorDarkTheme),
    colorScheme: ColorScheme.dark().copyWith(
      primary: mPrimaryColor,
      secondary: mSecondaryColor,
      error: mErrorColor,
    ),
  );
}

final appBarTheme = AppBarTheme(elevation: 0);
