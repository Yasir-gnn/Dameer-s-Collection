// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   var googleAuthCredential = GoogleAuthProvider.credential(accessToken: 'xxxx');

//   bool _isPasswordObscure = true; //Password visibility flag
//   bool _isConfirmPasswordObscure = true; //Password visibility flag
//   bool _isChecked = false;
//   bool _isSignUpSuccessful = false; // Track sign-up success
//   bool isEmailAlreadyInUse = false;

// ////////////////////

//   void showMessageDialog(String errorMessage) {
//     List<Widget> actions;

//     if (_isSignUpSuccessful) {
//       actions = [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => LoginScreen(),
//               ),
//             );
//           },
//           child: const Text('Ok'),
//         ),
//       ];
//     } else if (isEmailAlreadyInUse) {
//       actions = [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog
//           },
//           child: const Text("Try Again"),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => LoginScreen(),
//               ),
//             );
//           },
//           child: const Text("Proceed to Log In"),
//         ),
//       ];
//     } else {
//       actions = [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop(); // Close the dialog
//           },
//           child: const Text("OK"),
//         ),
//       ];
//     }

//     // Set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: const Text('Alert'),
//       content: Text(errorMessage),
//       actions: actions,
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

// ////////////////////

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: MediaQuery.of(context).size.height,
//             minWidth: MediaQuery.of(context).size.width,
//           ),
//           child: IntrinsicHeight(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 6.w),
//                     child: const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                           fontSize: 28,
//                           fontFamily: 'assests/fonts/PoppingsBold.ttf',
//                           fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 6.w),
//                     child: const Text(
//                       'Enter your details below & free sign up',
//                       style: TextStyle(
//                           color: Color(0xffB8B8D2),
//                           fontSize: 12,
//                           fontFamily: 'assests/fonts/PoppingsBold.ttf',
//                           fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 1.h,
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: 100.w,
//                     decoration: const BoxDecoration(
//                         color: Color(0xff2F2F42),
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20),
//                             topRight: Radius.circular(20))),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(height: 6.h),
//                           Padding(
//                             padding: EdgeInsets.only(left: 5.w),
//                             child: SizedBox(
//                               width: 100.w,
//                               child: const Text(
//                                 'Your Email',
//                                 style: TextStyle(
//                                   fontFamily:
//                                       'assets/fonts/PoppingsRegular.ttf',
//                                   fontSize: 14,
//                                   color: Color(0xffB8B8D2),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 5.w, right: 5.w),
//                             child: TextFormField(
//                               controller: _emailController,
//                               keyboardType: TextInputType.emailAddress,
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                     borderSide: BorderSide(
//                                         width: 1.sp, color: Colors.grey)),
//                                 hintText: "abc@example.com",
//                                 hintStyle: const TextStyle(color: Colors.white),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your email';
//                                 } else if (!value.contains('@')) {
//                                   return 'Please enter a valid email';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           SizedBox(
//                             height: 3.h,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 5.w),
//                             child: SizedBox(
//                               width: 100.w,
//                               child: const Text(
//                                 'Password',
//                                 style: TextStyle(
//                                   fontFamily:
//                                       'assets/fonts/PoppingsRegular.ttf',
//                                   fontSize: 14,
//                                   color: Color(0xffB8B8D2),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 5.w, right: 5.w),
//                             child: TextFormField(
//                               controller: _passwordController,
//                               obscureText: _isPasswordObscure,
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                   borderSide: BorderSide(
//                                       width: 1.sp, color: Colors.grey),
//                                 ),
//                                 hintText: 'Enter your password',
//                                 hintStyle: const TextStyle(color: Colors.white),
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     _isPasswordObscure
//                                         ? Icons.visibility
//                                         : Icons.visibility_off,
//                                   ),
//                                   onPressed: () {
//                                     setState(
//                                       () {
//                                         _isPasswordObscure =
//                                             !_isPasswordObscure;
//                                       },
//                                     );
//                                   },
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your password';
//                                 } else if (value.length < 6) {
//                                   return 'Password must be at least 6 characters';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           SizedBox(
//                             height: 3.h,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 5.w),
//                             child: SizedBox(
//                               width: 100.w,
//                               child: const Text(
//                                 'Confirm Password',
//                                 style: TextStyle(
//                                   fontFamily:
//                                       'assets/fonts/PoppingsRegular.ttf',
//                                   fontSize: 14,
//                                   color: Color(0xffB8B8D2),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: 5.w, right: 5.w),
//                             child: TextFormField(
//                               controller: _confirmPasswordController,
//                               obscureText: _isConfirmPasswordObscure,
//                               decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                   borderSide: BorderSide(
//                                       width: 1.sp, color: Colors.grey),
//                                 ),
//                                 hintText: 'Enter your password again',
//                                 hintStyle: const TextStyle(
//                                     color: Color.fromARGB(255, 51, 50, 50)),
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     _isConfirmPasswordObscure
//                                         ? Icons.visibility
//                                         : Icons.visibility_off,
//                                   ),
//                                   onPressed: () {
//                                     setState(
//                                       () {
//                                         _isConfirmPasswordObscure =
//                                             !_isConfirmPasswordObscure;
//                                       },
//                                     );
//                                   },
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return 'Please enter your password';
//                                 } else if (value != _passwordController.text) {
//                                   return 'Password do not match';
//                                 }
//                                 return null;
//                               },
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 32,
//                           ),
//                           CheckboxListTile(
//                             title: const Text(
//                               "By creating an account you have to agree with our terms & condition.",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 13,
//                                   fontFamily: 'assests/fonts/PoppingsBold.ttf',
//                                   fontWeight: FontWeight.w400),
//                             ),
//                             value: _isChecked,
//                             onChanged: (newBool) {
//                               setState(() {
//                                 _isChecked = newBool!;
//                               });
//                             },
//                             activeColor: Colors.orangeAccent,
//                             checkColor: Colors.white,
//                             controlAffinity: ListTileControlAffinity.leading,
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           ElevatedButton(
//                             onPressed: _isChecked
//                                 ? () async {
//                                     if (_formKey.currentState!.validate()) {
//                                       try {
//                                         await _auth
//                                             .createUserWithEmailAndPassword(
//                                           email:
//                                               _emailController.text.toString(),
//                                           password: _passwordController.text
//                                               .toString(),
//                                         );
//                                         setState(() {
//                                           _isSignUpSuccessful = true;
//                                         });
//                                         showMessageDialog(
//                                           "Sign Up Successful",
//                                         );
//                                       } on FirebaseAuthException catch (e) {
//                                         if (e.code == 'email-already-in-use') {
//                                           setState(() {
//                                             isEmailAlreadyInUse = true;
//                                           });
//                                           showMessageDialog(
//                                             'The account already exists for that email.',
//                                           );
//                                         } else {
//                                           showMessageDialog(
//                                             'The error code: ${e.message}',
//                                           );
//                                         }
//                                       }
//                                     }
//                                   }
//                                 : null, // Disable the button if _isChecked is false
//                             child: const Text('Sign Up'),
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 "Already have an account?",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 13,
//                                     fontFamily:
//                                         'assests/fonts/PoppingsBold.ttf',
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               SizedBox(
//                                 width: 2.w,
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => LoginScreen()),
//                                   );
//                                 },
//                                 child: const Text(
//                                   "Log in",
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       decorationColor: Colors.blue,
//                                       color: Colors.blue,
//                                       fontSize: 13,
//                                       fontFamily:
//                                           'assests/fonts/PoppingsBold.ttf',
//                                       fontWeight: FontWeight.w400),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
