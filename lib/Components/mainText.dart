import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class loginText extends StatelessWidget {
  final String title;
  const loginText({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: 15.h,
      margin: EdgeInsets.only(top: 10.h),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: AppConstants.textFont,
            color: AppColors.blackTextColor,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp),
      ),
    );
  }
}
