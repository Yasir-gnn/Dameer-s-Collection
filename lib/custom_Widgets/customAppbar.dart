import 'dart:core';

import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class customAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String Title;

  const customAppBar({
    required this.Title,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(8.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(4.w),
                    child: SvgPicture.asset(
                        '${AppConstants.assetSvgIcons}more.svg',
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            title: Text(
              Title,
              style: TextStyle(
                  fontFamily: AppConstants.textFont,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
            actions: [
              Container(
                padding: EdgeInsets.all(3.w),
                child: SvgPicture.asset(
                    '${AppConstants.assetSvgIcons}Bell_pin.svg',
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
