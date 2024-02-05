import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class customSvgText extends StatelessWidget {
  const customSvgText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      child: Row(
        children: [
          Gap(14.w),
          Text(
            'Women',
            style: TextStyle(
                fontFamily: AppConstants.textFont,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          Gap(14.w),
          Text(
            'Men',
            style: TextStyle(
                fontFamily: AppConstants.textFont,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          Gap(13.w),
          Text(
            'Accesories',
            style: TextStyle(
                fontFamily: AppConstants.textFont,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          Gap(10.w),
          Text(
            'Beauty',
            style: TextStyle(
                fontFamily: AppConstants.textFont,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
