import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class customDiscoverContainer extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final double left;
  const customDiscoverContainer({
    required this.image,
    required this.color,
    required this.title,
    required this.left,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 90.w,
      margin: EdgeInsets.only(top: 2.h, left: 5.w),
      child: Stack(
        children: [
          Container(
            height: 20.h,
            width: 90.w,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: color),
            child: Container(
              margin: EdgeInsets.only(
                  top: 1.h, left: 48.w, right: 8.w, bottom: 1.h),
              padding: const EdgeInsets.all(20),
              height: 12.h,
              width: 10.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white.withOpacity(0.4)),
              child: Container(
                height: 6.h,
                width: 8.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white.withOpacity(0.5)),
              ),
            ),
          ),
          Positioned(
            left: left,
            child: Image.asset(
              image,
              height: 22.h,
              width: 100.w,
            ),
          ),
          Positioned(
            top: 8.h,
            left: 5.w,
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: AppConstants.textFont,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.ColorwhiteBackground),
            ),
          ),
        ],
      ),
    );
  }
}
