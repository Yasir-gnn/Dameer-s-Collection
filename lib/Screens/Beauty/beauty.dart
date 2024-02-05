import 'package:dameer_collection/Model/ItemsModel.dart';
import 'package:dameer_collection/Screens/Accessories/accessories.dart';
import 'package:dameer_collection/Screens/Homepage/homepage.dart';
import 'package:dameer_collection/Screens/Men_Screen/men_screen.dart';
import 'package:dameer_collection/Utils/app_colors.dart';

import 'package:dameer_collection/Utils/app_contants.dart';

import 'package:dameer_collection/custom_Widgets/custom_main_class.dart';
import 'package:flutter/material.dart';

class beauty extends StatefulWidget {
  const beauty({super.key});

  @override
  State<beauty> createState() => _homepageState();
}

class _homepageState extends State<beauty> {
  static List<String> image = [
    '${AppConstants.assetImages}makeupkit.jpg',
    '${AppConstants.assetImages}eyeshadow.jpg',
    '${AppConstants.assetImages}base.jpg',
    '${AppConstants.assetImages}base1.jpg',
    '${AppConstants.assetImages}eyeliner.jpg',
    '${AppConstants.assetImages}eyeliner1.jpg',
  ];
  static List<String> title = [
    'Makeup Kit',
    'Eyeshadow Kit',
    'Skin Tone Base',
    'Dark Tone Base',
    'EyeLiner',
    'Waterproof Eyeliner',
  ];

  static List<String> title1 = [
    '\$ 65.00',
    '\$ 56.00',
    '\$ 45.00',
    '\$ 51.00',
    '\$ 18.00',
    '\$ 28.00',
  ];

  final List<ItemsModel> Items = List.generate(image.length,
      (index) => ItemsModel(image[index], title[index], title1[index]));
  @override
  Widget build(BuildContext context) {
    return customMainClass(
      maintitle: 'Beauty Collection 2024',
      Items: Items,
      mainImage: '${AppConstants.assetImages}beauty_main.jpg',
      iconColor4: AppColors.ColorwhiteBackground,
      backgroundColor4: AppColors.blackTextColor,
      onTap1: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const homepage()));
      },
      onTap2: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const menScreen()));
      },
      onTap3: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const accessories()));
      },
    );
  }
}
