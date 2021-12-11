import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/core/const/app_color.dart';

class AppTheme {
  static final darkThemeCopy = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColor.iconcolor)),
    ),
    textTheme: TextTheme(bodyText1: GoogleFonts.oxygen(color: Colors.black)),
    iconTheme: const IconThemeData(color: Colors.orange),
    scaffoldBackgroundColor: Colors.black12,
  );
}
