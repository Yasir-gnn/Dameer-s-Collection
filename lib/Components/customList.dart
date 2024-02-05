import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gap/gap.dart';

class customList extends StatelessWidget {
  final String Image;
  final String? title;
  final String? title1;
  final void Function()? onTap;
  const customList({
    required this.Image,
    required this.title,
    required this.title1,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(left: 5.w, top: 1.h),
            height: 28.h,
            width: 35.w,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage(
                    Image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Gap(1.h),
        Text(
          title ?? '',
          style: TextStyle(
              fontFamily: AppConstants.textFont,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ),
        Text(
          title1 ?? '',
          style: TextStyle(
              fontFamily: AppConstants.textFont,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
