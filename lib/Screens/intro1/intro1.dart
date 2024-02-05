import 'package:dameer_collection/Routes/app_Navigation.dart';
import 'package:dameer_collection/Routes/app_navigation_routes.dart';
//import 'package:dameer_collection/Screens/intro2/intro2.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:dameer_collection/custom_Widgets/custom_intro_page.dart';
import 'package:flutter/material.dart';

//import 'package:responsive_sizer/responsive_sizer.dart';

class intro1 extends StatelessWidget {
  const intro1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customIntroPage(
            title: 'Update trendy outfit',
            subtitle: 'Favorite brands and hottest trends',
            image: '${AppConstants.assetImages}intro2.png',
            onTap: () {
              AppNavigation.navigateTo(routeName: AppNavRoutes.intro2);
            },
          ),
        ],
      ),
    );
  }
}
