import 'package:dameer_collection/Model/ItemsModel.dart';
import 'package:dameer_collection/Screens/Accessories/accessories.dart';
import 'package:dameer_collection/Screens/Beauty/beauty.dart';
import 'package:dameer_collection/Screens/Men_Screen/men_screen.dart';
import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';

import 'package:dameer_collection/custom_Widgets/custom_main_class.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  static List<String> image = [
    '${AppConstants.assetImages}hp_slider1.png',
    '${AppConstants.assetImages}hp_slider2.png',
    '${AppConstants.assetImages}hp_slider3.png',
    '${AppConstants.assetImages}hp_slider4.png',
    '${AppConstants.assetImages}hp_slider5.png',
    '${AppConstants.assetImages}hp_slider6.png'
  ];
  static List<String> title = [
    'Turtleneck Sweater',
    'Long Sleeve Dress',
    'Sportwear Set',
    'Ribbed Top',
    'Crop Top',
    'Knitted vest Dress'
  ];

  static List<String> title1 = [
    '\$ 39.99',
    '\$ 45.00',
    '\$ 85.00',
    '\$ 25.00',
    '\$ 24.00',
    '\$ 64.00'
  ];

  final List<ItemsModel> Items = List.generate(title.length,
      (index) => ItemsModel(image[index], title[index], title1[index]));
  @override
  Widget build(BuildContext context) {
    return customMainClass(
      Items: Items,
      mainImage: '${AppConstants.assetImages}homepage.jpg',
      iconColor1: AppColors.ColorwhiteBackground,
      backgroundColor1: AppColors.blackTextColor,
      maintitle: 'Women\'s Collection 2024',
      onTap2: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const menScreen()));
      },
      onTap3: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const accessories()));
      },
      onTap4: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const beauty()));
      },
    );
  }
}
