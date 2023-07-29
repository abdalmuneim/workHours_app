import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workhours/common/resources/app_color.dart';
import 'package:sizer/sizer.dart';
import 'package:workhours/common/resources/font_manager.dart';

ThemeData get applicationTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldColor,
      useMaterial3: false,

      /// Main Color
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.lightPrimary,
      primaryColorDark: Colors.black,
      disabledColor: Colors.grey,

      ///list tile
      listTileTheme: ListTileThemeData(
        iconColor: AppColors.black,
        visualDensity: VisualDensity.comfortable,
        titleTextStyle: TextStyle(
          fontFamily: FontManager.fontFamily,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: FontManager.fontFamily,
        ),
      ),

      /// CardViewTheme
      cardTheme: CardTheme(
          color: AppColors.white,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

      /// AppBar Theme
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: AppColors.scaffoldColor,
        ),
        toolbarHeight: 100,
        backgroundColor: AppColors.scaffoldColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(),
      ),

      /// Button Theme
      buttonTheme: const ButtonThemeData(),

      /// text button
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontFamily: FontManager.fontFamily,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ),
      ),

      /// Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(90.w, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: TextStyle(
            fontFamily: FontManager.fontFamily,
            fontSize: 14.sp,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: AppColors.lightPrimary,
        ),
      ),

      /// Text Theme
      textTheme: TextTheme(
        //
        headlineLarge: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),

        headlineMedium: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        headlineSmall: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        labelLarge: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 16.sp,
          fontWeight: FontWeightManger.semiBold,
          color: AppColors.black,
        ),
        labelMedium: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 15.sp,
          fontWeight: FontWeightManger.regular,
          color: AppColors.black,
        ),
        labelSmall: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeightManger.medium,
          color: AppColors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 12.sp,
          fontWeight: FontWeightManger.regular,
          color: AppColors.lightGrey,
        ),
        bodySmall: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 8.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGrey,
        ),
      ),

      /// Input Decoration Theme (text form filed)
    );