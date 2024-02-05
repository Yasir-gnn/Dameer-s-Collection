import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class lastText extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final String subtitle;
  const lastText({
    required this.title,
    required this.onTap,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
              fontFamily: AppConstants.textFont,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blackTextColor),
        ),
        Gap(1.w),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subtitle,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: AppConstants.textFont,
                fontSize: 16.sp,
                color: AppColors.blackTextColor),
          ),
        ),
      ],
    );
  }
}
