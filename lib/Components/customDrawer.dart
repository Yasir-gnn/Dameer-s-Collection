import 'package:dameer_collection/Components/customDivider.dart';
import 'package:dameer_collection/Components/drawerItem.dart';
import 'package:dameer_collection/Providers/custom_theme_provider.dart';
import 'package:dameer_collection/Routes/app_Navigation.dart';
import 'package:dameer_collection/Routes/app_navigation_routes.dart';

import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:toggle_switch/toggle_switch.dart';

class customDrawer extends StatefulWidget {
  final String Image;
  final void Function() onTap;
  final String Title;
  final TextEditingController? usernameController;
  const customDrawer(
      {required this.Image,
      required this.onTap,
      required this.Title,
      this.usernameController,
      super.key});

  @override
  State<customDrawer> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<customDrawer> {
  bool isDarkMode = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Gap(4.h),
          Text(
            widget.usernameController?.text ?? 'Dameer\'s Collection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Gap(4.h),
          GestureDetector(
            onTap: widget.onTap,
            child: drawerItem(
              name: widget.Title,
              Image: widget.Image,
            ),
          ),
          const CustomDivider(),
          Gap(4.h),
          drawerItem(
            onTap: () {
              AppNavigation.navigateTo(routeName: AppNavRoutes.homepage);
            },
            name: 'Women',
            Image: '${AppConstants.assetSvgIcons}hp_women.svg',
            height: 3.h,
            width: 5.w,
          ),
          const CustomDivider(),
          Gap(4.h),
          drawerItem(
            onTap: () {
              AppNavigation.navigateTo(routeName: AppNavRoutes.menScreen);
            },
            name: 'Men',
            Image: '${AppConstants.assetSvgIcons}hp_men.svg',
            height: 3.h,
            width: 3.w,
          ),
          const CustomDivider(),
          Gap(4.h),
          drawerItem(
            onTap: () {
              AppNavigation.navigateTo(routeName: AppNavRoutes.accessories);
            },
            name: 'Accesories',
            Image: '${AppConstants.assetSvgIcons}hp_accesories.svg',
            height: 2.h,
            width: 2.w,
          ),
          const CustomDivider(),
          Gap(4.h),
          drawerItem(
            onTap: () {
              AppNavigation.navigateTo(routeName: AppNavRoutes.beauty);
            },
            name: ' Beauty',
            Image: '${AppConstants.assetSvgIcons}hp_beauty.svg',
          ),
          const CustomDivider(),
          Gap(4.h),
          drawerItem(
            name: ' SignOut',
            Image: '${AppConstants.assetSvgIcons}logout.svg',
            height: 2.h,
            width: 2.w,
            onTap: () async {
              await _signOut();
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          ChangeNotifierProvider<CustomThemeProvider>(
            create: (context) => CustomThemeProvider(),
            child: ToggleSwitch(
              minWidth: 25.w,
              minHeight: 6.h,
              cornerRadius: 30.0,
              activeBgColor: const [AppColors.ColorwhiteBackground],
              activeFgColor: AppColors.blackTextColor,
              inactiveBgColor: Colors.grey,
              initialLabelIndex:
                  Provider.of<CustomThemeProvider>(context).toggleSwitchIndex,
              totalSwitches: 2,
              labels: const ['Light', 'Dark'],
              icons: const [Icons.sunny, Icons.dark_mode],
              changeOnTap: true,
              onToggle: (index) {
                Provider.of<CustomThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              customTextStyles: [
                TextStyle(
                    fontFamily: AppConstants.textFont,
                    fontSize: 18.sp,
                    color: AppColors.blackTextColor)
              ],
              radiusStyle: true,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();

      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }

      AppNavigation.pushAndKillAll(routeName: AppNavRoutes.welcome);
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
