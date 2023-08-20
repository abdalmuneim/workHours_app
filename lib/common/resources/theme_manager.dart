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

      iconTheme: IconThemeData(
        color: AppColors.lightGrey,
      ),

      ///list tile
      listTileTheme: ListTileThemeData(
        iconColor: AppColors.black,
        visualDensity: VisualDensity.comfortable,
        titleTextStyle: TextStyle(
            fontFamily: FontManager.fontFamily, color: AppColors.black),
        subtitleTextStyle: TextStyle(
            fontFamily: FontManager.fontFamily, color: AppColors.lightGrey),
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
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: AppColors.scaffoldColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.black),
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
          elevation: 3,
          minimumSize: Size(100.w, 40),
          maximumSize: Size(100.w, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: TextStyle(
            fontFamily: FontManager.fontFamily,
            fontSize: 14.sp,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          // side: BorderSide(color: AppColors.grey.withOpacity(.3)),

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
          fontSize: 14.sp,
          fontWeight: FontWeightManger.semiBold,
          color: AppColors.black,
        ),
        labelMedium: TextStyle(
          fontFamily: FontManager.fontFamily,
          fontSize: 13.sp,
          fontWeight: FontWeightManger.semiBold,
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
