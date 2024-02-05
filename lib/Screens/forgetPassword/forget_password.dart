import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dameer_collection/Screens/Login/loginScreen.dart';
import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  void showUpDialog(String errorMessage) {
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const loginScreen(),
          ),
        );
      },
      child: const Text("Ok"),
    );
    AlertDialog alert = AlertDialog(
      title: const Text('Alert'),
      content: Text(
        'Email Sent!',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: AppConstants.textFont, fontSize: 20.sp),
      ),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            Container(
              width: 90.w,
              margin: EdgeInsets.only(top: 10.h),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontFamily: AppConstants.textFont,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: 80.w,
              margin: EdgeInsets.only(top: 3.h),
              child: Text(
                'Enter email associated with your account and we’ll send and email with instructions to reset your password',
                style: TextStyle(
                  fontFamily: AppConstants.textFont,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Gap(10.h),
                  TextFormField(
                    textCapitalization: TextCapitalization.none,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email here',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(10.h),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        AppColors.blackTextColor,
                      ),
                      fixedSize: MaterialStateProperty.all(Size(40.w, 7.h)),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var forgetPassword = _emailController.text.toString();
                        try {
                          FirebaseAuth.instance
                              .sendPasswordResetEmail(email: forgetPassword)
                              .then(
                                (value) => {showUpDialog('Email Sent!')},
                              );
                        } on FirebaseAuthException catch (e) {
                          print('Error $e');
                        }
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppConstants.textFont,
                        color: AppColors.ColorwhiteBackground,
                      ),
                    ),
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
