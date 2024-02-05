//import 'package:dameer_collection/Screens/intro1.dart';
//import 'package:dameer_collection/Screens/Login/createAccount.dart';
import 'package:dameer_collection/Routes/app_Navigation.dart';
import 'package:dameer_collection/Routes/app_navigation_routes.dart';
//import 'package:dameer_collection/Screens/Login/signUp.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:dameer_collection/custom_Widgets/custom_intro_page.dart';
import 'package:flutter/material.dart';

//import 'package:responsive_sizer/responsive_sizer.dart';

class intro2 extends StatelessWidget {
  const intro2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customIntroPage(
            title: 'Explore your true style',
            subtitle: 'Relax and let us bring the style to you',
            image: '${AppConstants.assetImages}intro3.png',
            onTap: () {
              AppNavigation.navigateTo(routeName: AppNavRoutes.signUp);
            },
          ),
        ],
      ),
    );
  }
}
