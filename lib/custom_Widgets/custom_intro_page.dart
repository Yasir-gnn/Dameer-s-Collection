import 'package:dameer_collection/Components/customButton.dart';
import 'package:dameer_collection/Utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class customIntroPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final void Function() onTap;

  const customIntroPage({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5.h,
          margin: EdgeInsets.only(top: 10.h),
          alignment: Alignment.center,
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
        Gap(2.h),
        Container(
          alignment: Alignment.center,
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        Stack(
          children: [
            Positioned(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 35.5.h),
                height: 40.25.h,
                width: 100.w,
                color: AppColors.introBackground,
              ),
            ),
            Positioned(
              top: 4.h,
              left: 15.w,
              child: Container(
                height: 50.h,
                width: 70.w,
                padding: EdgeInsets.only(top: 2.h),
                decoration: const BoxDecoration(
                    color: AppColors.intropicBackground,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 65.h,
              left: 30.w,
              child: GestureDetector(
                  onTap: onTap,
                  child: const customButton(title: 'Shopping Now')),
            ),
          ],
        ),
      ],
    );
  }
}
