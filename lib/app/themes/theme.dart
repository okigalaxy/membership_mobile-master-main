import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:membership/app/utils/color_resource.dart';
import 'package:membership/app/utils/dimensions.dart';

class ThemeApp {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: ColorResources.backgroundColor,
    primarySwatch: ColorResources.primaryMaterial,
    fontFamily: GoogleFonts.poppins().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),
        overlayColor:
            MaterialStateProperty.all(const Color.fromARGB(99, 182, 151, 105)),
      ),
    ),
  );
}
