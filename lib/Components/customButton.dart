import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class customButton extends StatelessWidget {
  final String title;

  const customButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 40.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(30)),
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.ColorwhiteBackground,
            fontFamily: AppConstants.textFont,
            fontSize: 15.sp,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
