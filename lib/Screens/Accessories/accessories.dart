import 'package:dameer_collection/Model/ItemsModel.dart';
import 'package:dameer_collection/Screens/Beauty/beauty.dart';
import 'package:dameer_collection/Screens/Homepage/homepage.dart';
import 'package:dameer_collection/Screens/Men_Screen/men_screen.dart';
import 'package:dameer_collection/Utils/app_colors.dart';

import 'package:dameer_collection/Utils/app_contants.dart';

import 'package:dameer_collection/custom_Widgets/custom_main_class.dart';
import 'package:flutter/material.dart';

class accessories extends StatefulWidget {
  const accessories({super.key});

  @override
  State<accessories> createState() => _homepageState();
}

class _homepageState extends State<accessories> {
  static List<String> image = [
    '${AppConstants.assetImages}acc_bag.jpg',
    '${AppConstants.assetImages}acc_bag1.jpg',
    '${AppConstants.assetImages}acc_bag2.jpg',
    '${AppConstants.assetImages}acc_bag3.jpg',
    '${AppConstants.assetImages}acc_bag4.jpg',
    '${AppConstants.assetImages}acc_bag5.jpg',
  ];
  static List<String> title = [
    'Dark Brown Leather Bag',
    'Pink Stylish Bag',
    'Red Leather Bag',
    'Black Leather Bag',
    'Dark Brown Leather Bag ',
    'Stylish LightPink Bag',
  ];

  static List<String> title1 = [
    '\$ 99.99',
    '\$ 75.00',
    '\$ 110.00',
    '\$ 101.00',
    '\$ 105.00',
    '\$ 64.00',
  ];

  final List<ItemsModel> Items = List.generate(image.length,
      (index) => ItemsModel(image[index], title[index], title1[index]));
  @override
  Widget build(BuildContext context) {
    return customMainClass(
      maintitle: 'Accessories Collection 2024',
      Items: Items,
      mainImage: '${AppConstants.assetImages}acc_main.jpg',
      iconColor3: AppColors.ColorwhiteBackground,
      backgroundColor3: AppColors.blackTextColor,
      onTap1: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const homepage()));
      },
      onTap2: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const menScreen()));
      },
      onTap4: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const beauty()));
      },
    );
  }
}
