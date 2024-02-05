import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.ColorwhiteBackground,
    fontFamily: AppConstants.textFont,
    primaryColor: AppColors.blackTextColor,
    textTheme: TextTheme(
        titleLarge: TextStyle(
          fontFamily: AppConstants.textFont,
          fontSize: 22.sp,
          color: AppColors.blackTextColor,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontFamily: AppConstants.textFont,
          fontSize: 20.sp,
          color: AppColors.blackTextColor,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          fontFamily: AppConstants.textFont,
          fontSize: 18.sp,
          color: AppColors.blackTextColor,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          fontFamily: AppConstants.textFont,
          fontSize: 18.sp,
          color: AppColors.blackTextColor,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: AppColors.blackTextColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.blackTextColor)),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.blackTextColor,
    fontFamily: AppConstants.textFont,
    // highlightColor: AppColors.ColorwhiteBackground.withOpacity(0.1),
    // colorScheme: ColorScheme.fromSwatch(
    //   backgroundColor: AppColors.ColorwhiteBackground,
    //   errorColor: AppColors.orange,
    // ),
    // iconTheme: IconThemeData(
    //   color: AppColors.blackTextColor,
    //   size: 36.h,
    // ),
    primaryColor: AppColors.ColorwhiteBackground,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        fill: 0,
        color: AppColors.ColorwhiteBackground,
        size: 24.sp,
      ),
      //leadingIcon: IconThemeData(),
      titleTextStyle: TextStyle(
        fontSize: 22.sp,
        color: AppColors.ColorwhiteBackground,
        fontWeight: FontWeight.w700,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.ColorwhiteBackground,
        size: 24.sp,
      ),
      backgroundColor: AppColors.blackTextColor,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 8.w,
      centerTitle: false,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.ColorwhiteBackground,
      linearTrackColor: AppColors.ColorwhiteBackground.withOpacity(0.25),
    ),

    // chipTheme: ChipThemeData(
    //   disabledColor: Colors.transparent,
    //   selectedColor: AppColors.ColorwhiteBackground,
    //   shape: const StadiumBorder(
    //     side: BorderSide(
    //       color: Colors.grey,
    //     ),
    //   ),
    //   showCheckmark: false,
    //   labelStyle: TextStyle(
    //     fontSize: 14.sp,
    //     color: Colors.grey,
    //   ),
    // ),

    ///////////////////////
    /// Buttons' Themes ///
    ///////////////////////

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.ColorwhiteBackground.withOpacity(0);
            }
            return AppColors.ColorwhiteBackground;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.ColorwhiteBackground.withOpacity(0.25);
            }
            return AppColors.ColorwhiteBackground;
          },
        ),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        overlayColor: MaterialStatePropertyAll(
            AppColors.ColorwhiteBackground.withOpacity(0.1)),
        shadowColor: MaterialStatePropertyAll(
            AppColors.ColorwhiteBackground.withOpacity(0.1)),
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return 0;
            }
            return 8.sp;
          },
        ),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        foregroundColor:
            const MaterialStatePropertyAll(AppColors.ColorwhiteBackground),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        overlayColor: MaterialStatePropertyAll(
            AppColors.ColorwhiteBackground.withOpacity(0.1)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            const MaterialStatePropertyAll(AppColors.ColorwhiteBackground),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        side: const MaterialStatePropertyAll(
          BorderSide(color: AppColors.ColorwhiteBackground),
        ),
        overlayColor: MaterialStatePropertyAll(
            AppColors.ColorwhiteBackground.withOpacity(0.1)),
        elevation: const MaterialStatePropertyAll(0),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: const MaterialStatePropertyAll(24),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        foregroundColor:
            const MaterialStatePropertyAll(AppColors.ColorwhiteBackground),
        overlayColor: MaterialStatePropertyAll(
            AppColors.ColorwhiteBackground.withOpacity(0.1)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 0.8.h,
            ),
            borderRadius: BorderRadius.circular(13.h),
          ),
        ),
      ),
    ),

    ///////////////////////
    /// Other Themes ///
    ///////////////////////

    dividerTheme: DividerThemeData(
      color: Colors.grey,
      thickness: 0.5.h,
    ),
    cardTheme: CardTheme(
      color: Colors.grey,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.grey.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.h),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      focusElevation: 0,
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: AppColors.ColorwhiteBackground,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: AppColors.ColorwhiteBackground,
        borderRadius: BorderRadius.circular(8.h),
      ),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      labelColor: AppColors.ColorwhiteBackground,
      unselectedLabelColor: AppColors.ColorwhiteBackground,
      dividerColor: Colors.transparent,
      labelPadding: EdgeInsets.all(8.h),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.blackTextColor,
      surfaceTintColor: Colors.transparent,
      //width: 200.w,
      //shape: const LinearBorder(),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.ColorwhiteBackground.withOpacity(0.3),
      contentTextStyle: const TextStyle(color: AppColors.ColorwhiteBackground),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.h),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.25),
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: AppColors.ColorwhiteBackground,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.h),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.h),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.h),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.h),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.h),
        ),
      ),
      hintStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: AppColors.ColorwhiteBackground,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.ColorwhiteBackground,
      selectionHandleColor: AppColors.ColorwhiteBackground,
      selectionColor: AppColors.ColorwhiteBackground.withOpacity(0.1),
    ),

    ///////////////////////
    /// Text Themes ///////
    ///////////////////////

    textTheme: TextTheme(
      /// Display Styles
      displayLarge: TextStyle(
        color: AppColors.ColorwhiteBackground,
        fontSize: 23.sp,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ),

      /// Label Styles
      titleLarge: TextStyle(
        fontFamily: AppConstants.textFont,
        fontSize: 22.sp,
        color: AppColors.ColorwhiteBackground,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        fontFamily: AppConstants.textFont,
        fontSize: 18.sp,
        color: AppColors.blackTextColor,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontFamily: AppConstants.textFont,
        fontSize: 20.sp,
        color: AppColors.ColorwhiteBackground,
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        color: AppColors.ColorwhiteBackground,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        color: AppColors.ColorwhiteBackground,
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: TextStyle(
        color: AppColors.ColorwhiteBackground,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),

      bodyLarge: TextStyle(
        color: AppColors.ColorwhiteBackground,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.ColorwhiteBackground,
        fontSize: 14.sp,
      ),

      ////////////////////////////////////////////////
      displayMedium: TextStyle(
        fontFamily: AppConstants.textFont,
        fontSize: 18.sp,
        color: AppColors.ColorwhiteBackground,
        fontWeight: FontWeight.w400,
      ),

      // Body Styles
      bodySmall: TextStyle(
        color: AppColors.ColorwhiteBackground,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),
      displaySmall: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.blackTextColor),

      // Headline Styles
      headlineMedium: TextStyle(
        color: AppColors.ColorwhiteBackground,
        fontSize: 14.sp,
      ),
      headlineSmall: TextStyle(
        color: AppColors.ColorwhiteBackground,
        fontSize: 12.sp,
      ),
    ),
  );
}
