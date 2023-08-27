import 'package:ecommerce/data/datasource/static/color.dart';
import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  fontFamily: "Cairo",
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white), // end of scroll color
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColor.blue),
  appBarTheme: const AppBarTheme(
    
    // iconTheme: IconThemeData(
    //   color: Colors.white,
    // ),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: AppColor.black,
      fontSize: 18,
    ),
    bodySmall: TextStyle(
      height: 2,
      color: AppColor.grey,
      fontSize: 15,
    ),
  ),
);
