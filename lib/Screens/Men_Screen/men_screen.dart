import 'package:dameer_collection/Model/ItemsModel.dart';
import 'package:dameer_collection/Screens/Accessories/accessories.dart';
import 'package:dameer_collection/Screens/Beauty/beauty.dart';
import 'package:dameer_collection/Screens/Homepage/homepage.dart';
import 'package:dameer_collection/Utils/app_colors.dart';

import 'package:dameer_collection/Utils/app_contants.dart';

import 'package:dameer_collection/custom_Widgets/custom_main_class.dart';
import 'package:flutter/material.dart';

class menScreen extends StatefulWidget {
  const menScreen({super.key});

  @override
  State<menScreen> createState() => _homepageState();
}

class _homepageState extends State<menScreen> {
  static List<String> image = [
    '${AppConstants.assetImages}men_blackJacket.jpg',
    '${AppConstants.assetImages}men_brownjacket.jpg',
    '${AppConstants.assetImages}men_coat.jpg',
    '${AppConstants.assetImages}men_hoddie.jpg',
    '${AppConstants.assetImages}men_leather.jpg',
    '${AppConstants.assetImages}men_sports.jpg',
    '${AppConstants.assetImages}men_sports1.jpg',
    '${AppConstants.assetImages}men_trouser.jpg',
    '${AppConstants.assetImages}men_trouser1.jpg',
    '${AppConstants.assetImages}men_trouser2.jpg',
  ];
  static List<String> title = [
    'Black Jacket',
    'Leather Brown Jacket',
    'Long Black Coat',
    'Black Hoddie',
    'Black Leather Jacket',
    'Sportwear Set',
    'Sportwear Set 1',
    'Black Trouser',
    'Brown Trouser',
    'Slimfit Trouser',
  ];

  static List<String> title1 = [
    '\$ 69.99',
    '\$ 145.00',
    '\$ 185.00',
    '\$ 78.00',
    '\$ 220.00',
    '\$ 35.00',
    '\$ 57.00',
    '\$ 45.00',
    '\$ 29.00',
    '\$ 22.00',
  ];

  final List<ItemsModel> Items = List.generate(image.length,
      (index) => ItemsModel(image[index], title[index], title1[index]));
  @override
  Widget build(BuildContext context) {
    return customMainClass(
      maintitle: 'Men\'s Collection 2024',
      Items: Items,
      mainImage: '${AppConstants.assetImages}men_main.jpg',
      iconColor2: AppColors.ColorwhiteBackground,
      backgroundColor2: AppColors.blackTextColor,
      onTap1: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const homepage()));
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
