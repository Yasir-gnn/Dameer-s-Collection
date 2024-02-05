import 'package:dameer_collection/Components/customContainer.dart';
import 'package:dameer_collection/Components/customDivider.dart';

import 'package:dameer_collection/Model/ItemsModel.dart';
import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class singleClass extends StatefulWidget {
  final ItemsModel itemsModel;
  const singleClass({super.key, required this.itemsModel});

  @override
  State<singleClass> createState() => _singleClassState();
}

class _singleClassState extends State<singleClass> {
  bool _isListOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Expanded(
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Column(children: [
              SizedBox(
                height: 40.h,
                width: 100.w,
                child: Image.asset(
                  widget.itemsModel.image,
                  fit: BoxFit.fill,
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(
                height: 6.h,
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 4.h,
                      width: 60.w,
                      child: Text(
                        widget.itemsModel.title,
                        style: TextStyle(
                            fontFamily: AppConstants.textFont,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                      width: 30.w,
                      child: Text(
                        widget.itemsModel.title1,
                        style: TextStyle(
                            fontFamily: AppConstants.textFont,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
              Gap(2.h),
              const CustomDivider(),
              SizedBox(
                height: 5.h,
                width: 100.w,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 7.w),
                      child: Text(
                        'Color',
                        style: TextStyle(
                          fontFamily: AppConstants.textFont,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.w),
                      child: Text(
                        'Size',
                        style: TextStyle(
                          fontFamily: AppConstants.textFont,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  customContainer(
                    margin: 7.w,
                    color: AppColors.container1,
                  ),
                  const customContainer(
                    color: AppColors.discover1,
                  ),
                  const customContainer(
                    color: AppColors.container2,
                  ),
                  customContainer(
                    margin: 27.w,
                    color: AppColors.container3,
                    text: 'S',
                  ),
                  const customContainer(
                    color: AppColors.container3,
                    text: 'M',
                  ),
                  const customContainer(
                    color: AppColors.container3,
                    text: 'L',
                  )
                ],
              ),
              Gap(2.h),
              const CustomDivider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isListOpen = !_isListOpen;
                  });
                },
                child: SizedBox(
                  height: 5.h,
                  width: 90.w,
                  //color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontFamily: AppConstants.textFont,
                          fontSize: 20.sp,
                        ),
                      ),
                      Icon(
                        _isListOpen
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                        color: Theme.of(context).primaryColor,
                        size: 24.sp,
                      ),
                    ],
                  ),
                ),
              ),
              if (_isListOpen) ...[
                SizedBox(
                  height: 9.5.h,
                  width: 100.w,
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(
                          'A sweater vest is an item of knitwear that is similar to a sweater, but without sleeves, usually with a low-cut neckline',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  margin: EdgeInsets.only(top: 14.57.h),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.cartbox),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.shopping_bag,
                        color: AppColors.ColorwhiteBackground,
                      ),
                      Gap(2.w),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                            fontFamily: AppConstants.textFont,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.ColorwhiteBackground),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
