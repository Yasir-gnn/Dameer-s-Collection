import 'package:dameer_collection/Routes/app_Navigation.dart';
import 'package:dameer_collection/Routes/app_navigation_routes.dart';
//import 'package:dameer_collection/Screens/intro1/intro1.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:dameer_collection/custom_Widgets/custom_intro_page.dart';
import 'package:flutter/material.dart';

//import 'package:responsive_sizer/responsive_sizer.dart';

class intro extends StatelessWidget {
  const intro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customIntroPage(
            title: 'Discover something new',
            subtitle: 'Special new arrivals just for you',
            image: '${AppConstants.assetImages}intro1.png',
            onTap: () {
              AppNavigation.navigateTo(routeName: AppNavRoutes.intro1);
            },
          ),
        ],
      ),
    );
  }
}
