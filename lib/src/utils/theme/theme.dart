import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colors.dart';

ThemeData lightThemeData = ThemeData(
  primarySwatch: AppColors.primaryColor.toMaterialColor(),
  primaryColor: AppColors.primaryColor,
  backgroundColor: AppColors.background,
  cardColor: AppColors.white,
  errorColor: AppColors.red,
  hoverColor: AppColors.primaryColor.withOpacity(0.2),
  bottomAppBarColor: Colors.white,
  iconTheme: IconThemeData(color: AppColors.primaryColor),
  brightness: Brightness.light,
  primaryTextTheme: TextTheme(
      button: GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColors.darkGrey,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      bodyText1: GoogleFonts.anton(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.darkGrey,
        letterSpacing: 1,
      ),
      bodyText2: GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle1: GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColors.darkGrey,
          fontSize: 16.sp,
        ),
      ),
      subtitle2: GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColors.white,
          fontSize: 17.sp,
        ),
      ),
      caption: GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppColors.yellow2,
          fontSize: 16.sp,
        ),
      )),
);

// ThemeData darkThemeData = ThemeData(
//   primarySwatch: AppColors.white.toMaterialColor(),
//   primaryColor: AppColors.white,
//   appBarTheme: AppBarTheme(
//     backgroundColor: Color(0xFF212332),
//     elevation: 10,
//     centerTitle: true,
//     iconTheme: IconThemeData(color: Colors.white54),
//     titleTextStyle: TextStyle(
//       color: Colors.blueGrey[100],
//       fontSize: 20,
//       fontFamily: 'Montserrat',
//       fontWeight: FontWeight.w400,
//       letterSpacing: 3,
//     ),
//   ),
//   backgroundColor: Colors.blueGrey[900],
//   cardColor: Color(0xFF2A2D3E),
//   errorColor: AppColors.red,
//   switchTheme: SwitchThemeData(
//     thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
//     trackColor: MaterialStateProperty.all(Color.fromARGB(255, 164, 199, 228)),
//   ),
//   primaryTextTheme: TextTheme(
//     button: TextStyle(
//       color: Colors.blueGrey[200],
//       decorationColor: Colors.blueGrey[50],
//     ),
//     bodyText1: TextStyle(
//       color: AppColors.primaryColor,
//       fontWeight: FontWeight.bold,
//     ),
//     bodyText2: TextStyle(
//       color: Colors.blueGrey[300],
//     ),
//     subtitle2: TextStyle(
//       color: Colors.white,
//     ),
//     subtitle1: TextStyle(
//       color: Colors.blueGrey[300],
//     ),
//     headline1: TextStyle(
//       color: Colors.white70,
//     ),
//     headline2: TextStyle(
//       color: Colors.white70,
//       fontWeight: FontWeight.bold,
//     ),
//     caption: TextStyle(
//       color: Colors.white70,
//     ),
//   ),
//   bottomAppBarColor: Colors.black,
//   iconTheme: IconThemeData(color: Colors.blueGrey[200]),
//   brightness: Brightness.dark,
// );
