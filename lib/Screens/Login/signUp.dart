import 'package:dameer_collection/Components/lastText.dart';
import 'package:dameer_collection/Components/mainText.dart';
import 'package:dameer_collection/Routes/app_Navigation.dart';
import 'package:dameer_collection/Routes/app_navigation_routes.dart';
//import 'package:dameer_collection/Screens/Homepage/homepage.dart';

//import 'package:dameer_collection/Screens/Login/loginScreen.dart';
import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => __loginState();
}

class __loginState extends State<signUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String error = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  void showErrorDialog(String errorMessage) {
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("Ok"),
    );

    // Set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text('Error'),
      content: Text(errorMessage),
      actions: [okButton],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const loginText(
              title: 'Create\n your account',
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    textCapitalization: TextCapitalization.none,
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Enter your name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(2.h),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.none,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!value.contains('@')) {
                        return 'Enter a valid email address';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(2.h),
                  TextFormField(
                    obscureText: true,
                    textCapitalization: TextCapitalization.none,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return 'Password must be atleast 4 characters long';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(2.h),
                  TextFormField(
                    obscureText: true,
                    textCapitalization: TextCapitalization.none,
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                    validator: (value) {
                      if (value != passwordController.text) {
                        return 'Password did not match';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(3.h),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll(
                            AppColors.blackTextColor),
                        fixedSize: MaterialStatePropertyAll(Size(40.w, 7.h))),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await _auth.createUserWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString(),
                          );
                          // ignore: use_build_context_synchronously
                          AppNavigation.navigateTo(
                              routeName: AppNavRoutes.homepage);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            showErrorDialog(
                                'The account already exists for that email.');
                          } else {
                            showErrorDialog('The error code :  ${e.message}');
                          }
                        }
                      }
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: AppConstants.textFont,
                          color: AppColors.ColorwhiteBackground),
                    ),
                  ),
                  Gap(3.h),
                  Text(
                    'or Sign up with',
                    style: TextStyle(
                        fontFamily: AppConstants.textFont,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Gap(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          '${AppConstants.assetSvgIcons}apple.svg'),
                      Gap(4.w),
                      SvgPicture.asset(
                          '${AppConstants.assetSvgIcons}google.svg'),
                      Gap(4.w),
                      SvgPicture.asset(
                          '${AppConstants.assetSvgIcons}facebook.svg')
                    ],
                  ),
                  Gap(3.h),
                  lastText(
                    title: 'Already have an account?',
                    onTap: () {
                      AppNavigation.navigateTo(
                          routeName: AppNavRoutes.loginScreen);
                    },
                    subtitle: 'Log In',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
