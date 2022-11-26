import 'package:flutter/material.dart';
import 'package:eduha/common/color_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  static ThemeData getTheme() {
    const Color primaryColor = Colors.black;
    final Map<int, Color> primaryColorMap = {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };
    final MaterialColor primaryMaterialColor =
        MaterialColor(primaryColor.value, primaryColorMap);

    return ThemeData(
      primaryColor: primaryColor,
      primarySwatch: primaryMaterialColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: ColorValues.backgroundColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: GoogleFonts.inter(
            color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: ColorValues.green,
          minimumSize: Size(double.infinity, 45.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
        headline2: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold
        ),
        headline3: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold
        ),
        headline4: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
        headline5: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        subtitle1: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        subtitle2: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        bodyText1: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: GoogleFonts.inter(
          color: Colors.black,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
