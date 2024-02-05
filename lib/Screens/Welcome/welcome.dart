import 'package:dameer_collection/Components/customButton.dart';
import 'package:dameer_collection/Routes/app_Navigation.dart';
import 'package:dameer_collection/Routes/app_navigation_routes.dart';
//import 'package:dameer_collection/Screens/Intro/intro.dart';
//import 'package:dameer_collection/Screens/Intro/intro.dart';
import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class welcome extends StatelessWidget {
  const welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.srcOver,
              ),
              child: Image.asset(
                '${AppConstants.assetImages}welcome.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 100.w,
            margin: EdgeInsets.only(top: 60.h),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: 'Welcome to',
                  style: TextStyle(
                      color: AppColors.ColorwhiteBackground,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppConstants.textFont,
                      fontSize: 20.sp),
                ),
                TextSpan(
                  text: ' \nDameer\'s Collection!',
                  style: TextStyle(
                      color: AppColors.ColorwhiteBackground,
                      fontWeight: FontWeight.w700,
                      fontFamily: AppConstants.textFont,
                      fontSize: 24.sp),
                )
              ]),
            ),
          ),
          Container(
            height: 5.h,
            margin: EdgeInsets.only(top: 70.h),
            alignment: Alignment.center,
            child: Text(
              'The home for a fashionista',
              style: TextStyle(
                  color: AppColors.ColorwhiteBackground,
                  fontWeight: FontWeight.w700,
                  fontFamily: AppConstants.textFont,
                  fontSize: 17.sp),
            ),
          ),
          GestureDetector(
            onTap: () {
              AppNavigation.navigateTo(routeName: AppNavRoutes.intro);
            },
            child: Container(
              margin: EdgeInsets.only(top: 80.h, left: 30.w, right: 30.w),
              child: const customButton(
                title: 'Get Started',
              ),
            ),
          )
        ],
      ),
    );
  }
}
