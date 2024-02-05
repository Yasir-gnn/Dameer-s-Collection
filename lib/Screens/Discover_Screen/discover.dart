import 'package:dameer_collection/Components/customDiscoverContainer.dart';
import 'package:dameer_collection/Components/customDivider.dart';
import 'package:dameer_collection/Components/customDrawer.dart';
import 'package:dameer_collection/Components/customListTile.dart';

import 'package:dameer_collection/Screens/Homepage/homepage.dart';
import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:dameer_collection/custom_Widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class discover extends StatefulWidget {
  const discover({super.key});

  @override
  State<discover> createState() => _discoverState();
}

class _discoverState extends State<discover> {
  bool isListOpen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const customAppBar(
        Title: 'Discover',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.only(left: 5.w),
              elevation: 1,
              child: Container(
                height: 6.h,
                width: 90.w,
                color: AppColors.search,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: EdgeInsets.only(left: 2.w),
                      child: SvgPicture.asset(
                        '${AppConstants.assetSvgIcons}search.svg',
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle:
                        const TextStyle(fontFamily: AppConstants.textFont),
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isListOpen = !isListOpen;
                });
              },
              child: customDiscoverContainer(
                left: 30.w,
                title: 'CLOTHING',
                image: '${AppConstants.assetImages}discover1.png',
                color: AppColors.discover1,
              ),
            ),
            if (isListOpen) ...[
              SizedBox(
                height: 40.h,
                width: 90.w,
                child: ListView(
                  children: [
                    customListTile(
                      title: 'Jacket',
                      onTap: () {},
                    ),
                    const CustomDivider(),
                    customListTile(
                      title: 'Dresses',
                      onTap: () {},
                    ),
                    const CustomDivider(),
                    customListTile(
                      title: 'Sweaters',
                      onTap: () {},
                    ),
                    const CustomDivider(),
                    customListTile(
                      title: 'Jeans',
                      onTap: () {},
                    ),
                    const CustomDivider(),
                    customListTile(
                      title: 'T-Shirts',
                      onTap: () {},
                    ),
                    const CustomDivider(),
                  ],
                ),
              ),
            ],
            customDiscoverContainer(
              left: 14.w,
              title: 'ACCESSORIES',
              image: '${AppConstants.assetImages}discover2.png',
              color: AppColors.discover2,
            ),
            customDiscoverContainer(
              left: 18.w,
              title: 'SHOES',
              image: '${AppConstants.assetImages}discover3.png',
              color: AppColors.discover3,
            ),
            customDiscoverContainer(
              left: 20.w,
              title: 'COLLECTION',
              image: '${AppConstants.assetImages}discover4.png',
              color: AppColors.discover4,
            ),
          ],
        ),
      ),
      drawer: customDrawer(
        Title: '  Homepage',
        Image: '${AppConstants.assetSvgIcons}home.svg',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const homepage()),
          );
        },
      ),
    );
  }
}
