import 'package:dameer_collection/Components/lastText.dart';
import 'package:dameer_collection/Components/mainText.dart';
import 'package:dameer_collection/Routes/app_Navigation.dart';
import 'package:dameer_collection/Routes/app_navigation_routes.dart';
//import 'package:dameer_collection/Screens/Homepage/homepage.dart';
import 'package:dameer_collection/Screens/Login/signUp.dart';
//import 'package:dameer_collection/Screens/forgetPassword/forget_password.dart';
import 'package:dameer_collection/Utils/app_colors.dart';
import 'package:dameer_collection/Utils/app_contants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => __loginState();
}

class __loginState extends State<loginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String error = '';
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

///////////////
  void _handleGoogleSignIn() async {
    try {
      // Sign out if there is a currently signed-in user
      await _googleSignIn.signOut();

      // Prompt user to select a Google account
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential authResult =
            await _auth.signInWithCredential(credential);

        // Check if the user is already registered in Firebase
        User? user = authResult.user;
        if (user != null) {
          // Navigate to HomeScreen after successful login
          AppNavigation.navigateTo(routeName: AppNavRoutes.homepage);
        } else {
          // Handle the case where the user is not registered
          showErrorDialog('User not registered. Please sign up.');
        }
      }
    } catch (e) {
      showErrorDialog('Error: $e');
    }
  }

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
        child: Column(
          children: [
            const loginText(
              title: 'Log into \n your account',
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Gap(2.h),
                  TextFormField(
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
                        return 'Password must be at least 4 characters long';
                      } else {
                        return null;
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      AppNavigation.navigateTo(
                          routeName: AppNavRoutes.ForgetPassword);
                    },
                    child: Container(
                        margin: EdgeInsets.only(top: 3.h, left: 49.w),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: AppConstants.textFont,
                            color: AppColors.blackTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                  ),
                  Gap(3.h),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          AppColors.blackTextColor),
                      fixedSize: MaterialStatePropertyAll(Size(40.w, 7.h)),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          await _auth.signInWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString(),
                          );
                          AppNavigation.navigateTo(
                              routeName: AppNavRoutes.homepage);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'network-request-failed') {
                            showErrorDialog('No Internet Connection');
                          } else if (e.code ==
                              "The supplied auth credential is incorrect, malformed or has expired.") {
                            return showErrorDialog('Enter a Valid Email ID');
                          } else if (e.code == 'invalid-credential') {
                            showErrorDialog(
                                'Email or Password Entered is incorrect');
                          } else if (e.code == 'too-many-requests') {
                            return showErrorDialog(
                                'Too many attempts please try later');
                          } else if (e.code == 'unknwon') {
                            showErrorDialog(
                                'Email and password field are required');
                          } else if (e.code == 'unknown') {
                            showErrorDialog(
                                'Email and Password Fields are required');
                            //print(e.code);
                          } else {
                            print(e.code);
                          }
                        }
                      }
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: AppConstants.textFont,
                        color: AppColors.ColorwhiteBackground,
                      ),
                    ),
                  ),
                  Gap(3.h),
                  Text(
                    'or Log in with',
                    style: TextStyle(
                      fontFamily: AppConstants.textFont,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          '${AppConstants.assetSvgIcons}apple.svg'),
                      Gap(4.w),
                      GestureDetector(
                        onTap: _handleGoogleSignIn,
                        child: SvgPicture.asset(
                            '${AppConstants.assetSvgIcons}google.svg'),
                      ),
                      Gap(4.w),
                      SvgPicture.asset(
                          '${AppConstants.assetSvgIcons}facebook.svg'),
                    ],
                  ),
                  Gap(10.h),
                  lastText(
                    title: 'Don\'t have an account?',
                    onTap: () {
                      AppNavigation.navigateTo(routeName: AppNavRoutes.signUp);
                    },
                    subtitle: 'Sign up',
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
