import 'package:dameer_collection/Components/customDrawer.dart';
import 'package:dameer_collection/Components/customList.dart';
import 'package:dameer_collection/Components/customSvgText.dart';
import 'package:dameer_collection/Components/svgContainer.dart';
import 'package:dameer_collection/Model/ItemsModel.dart';
import 'package:dameer_collection/Screens/Discover_Screen/discover.dart';
//import 'package:dameer_collection/Screens/Men_Screen/men_screen.dart';
import 'package:dameer_collection/Screens/singleClass/singleClass.dart';
import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:dameer_collection/custom_Widgets/customAppbar.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class customMainClass extends StatelessWidget {
  final void Function()? onTap1;
  final void Function()? onTap2;
  final void Function()? onTap3;
  final void Function()? onTap4;
  final Color? backgroundColor1;
  final Color? backgroundColor2;
  final Color? backgroundColor3;
  final Color? backgroundColor4;
  final Color? iconColor1;
  final Color? iconColor2;
  final Color? iconColor3;
  final Color? iconColor4;
  final String mainImage;
  final String maintitle;
  const customMainClass({
    this.onTap1,
    this.onTap2,
    this.onTap3,
    this.onTap4,
    this.backgroundColor1,
    this.backgroundColor2,
    this.backgroundColor3,
    this.backgroundColor4,
    this.iconColor1,
    this.iconColor2,
    this.iconColor3,
    this.iconColor4,
    required this.mainImage,
    required this.maintitle,
    super.key,
    required this.Items,
  });

  final List<ItemsModel> Items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(
        Title: 'Dameer\'s Collection',
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: onTap1,
                  child: svgContainer(
                    image: '${AppConstants.assetSvgIcons}hp_women.svg',
                    backgroundColor: backgroundColor1 ?? AppColors.container3,
                    iconColor: iconColor1 ?? AppColors.blackTextColor,
                  ),
                ),
                GestureDetector(
                  onTap: onTap2,
                  child: svgContainer(
                    image: '${AppConstants.assetSvgIcons}hp_men.svg',
                    iconColor: iconColor2,
                    backgroundColor: backgroundColor2 ?? AppColors.container3,
                  ),
                ),
                GestureDetector(
                  onTap: onTap3,
                  child: svgContainer(
                    image: '${AppConstants.assetSvgIcons}hp_accesories.svg',
                    iconColor: iconColor3,
                    backgroundColor: backgroundColor3 ?? AppColors.container3,
                  ),
                ),
                GestureDetector(
                  onTap: onTap4,
                  child: svgContainer(
                    image: '${AppConstants.assetSvgIcons}hp_beauty.svg',
                    iconColor: iconColor4,
                    backgroundColor: backgroundColor4 ?? AppColors.container3,
                  ),
                ),
              ],
            ),
          ),
          const customSvgText(),
          Gap(2.h),
          Stack(
            children: [
              SizedBox(
                height: 30.h,
                width: 100.w,
                child: Card(
                  margin: EdgeInsets.only(left: 5.w, right: 5.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.h),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3.h),
                    child: Image.asset(
                      mainImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 6.h, left: 55.w),
                  child: Text(
                    maintitle,
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.ColorwhiteBackground,
                        fontFamily: AppConstants.textFont),
                  ))
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 8.w, top: 2.h),
            child: Text(
              'Feature Products',
              style: TextStyle(
                  fontFamily: AppConstants.textFont,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 35.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Items.length,
                    itemBuilder: (context, index) {
                      return customList(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    singleClass(itemsModel: Items[index])));
                          },
                          Image: Items[index].image,
                          title: Items[index].title,
                          title1: Items[index].title1);
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      drawer: customDrawer(
        Title: 'Discover',
        Image: '${AppConstants.assetSvgIcons}search.svg',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const discover()),
          );
        },
      ),
    );
  }
}
