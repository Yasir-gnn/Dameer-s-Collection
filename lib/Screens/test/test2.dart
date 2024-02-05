// import 'package:dameer_collection/Utils/app_contants.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   bool _isPasswordObscure = true; //Password visibility flag

//   GoogleSignInAccount? _currentUser;
//   @override
//   void initState() {
//     _googleSignIn.onCurrentUserChanged.listen((account) {
//       setState(() {
//         _currentUser = account;
//       });
//     });
//     _googleSignIn.signInSilently();
//     super.initState();
//   }

// ///////////////
//   void _handleGoogleSignIn() async {
//     try {
//       // Sign out if there is a currently signed-in user
//       await _googleSignIn.signOut();

//       // Prompt user to select a Google account
//       GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

//       if (googleSignInAccount != null) {
//         GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;

//         AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );

//         UserCredential authResult =
//             await _auth.signInWithCredential(credential);

//         // Navigate to HomeScreen after successful login
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       }
//     } catch (e) {
//       showErrorDialog('Error: $e');
//     }
//   }

// ///////////////////

// ///////////////////////////////

//   void showErrorDialog(String errorMessage) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Alert'),
//           content: Text(errorMessage),
//           actions: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Ok"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// ///////////////////

//   Future<void> signIn() async {
//     try {
//       await _googleSignIn.signIn();
//     } catch (e) {
//       print('Error Message in $e');
//     }
//   }

// ////////////
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
//                     child: Text(
//                       'Log In',
//                       style: TextStyle(
//                           fontSize: 28,
//                           fontFamily: 'assests/fonts/PoppingsBold.ttf',
//                           fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 3.5.h,
//                 ),
//                 Expanded(
//                   child: Container(
//                     width: 100.w,
//                     decoration: BoxDecoration(
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
//                             child: Container(
//                               width: 100.w,
//                               child: Text(
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
//                                 hintStyle: TextStyle(color: Colors.white),
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
//                             child: Container(
//                               width: 100.w,
//                               child: Text(
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
//                                 hintStyle: TextStyle(color: Colors.white),
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
//                             height: 6.h,
//                           ),
//                           ElevatedButton(
//                             onPressed: () async {
//                               if (_formKey.currentState!.validate()) {
//                                 try {
//                                   await _auth.signInWithEmailAndPassword(
//                                     email: _emailController.text.toString(),
//                                     password:
//                                         _passwordController.text.toString(),
//                                   );

//                                   // Navigate to HomeScreen after successful login
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => HomeScreen()),
//                                   );
//                                 } on FirebaseAuthException catch (e) {
//                                   // Show error dialog here
//                                   showErrorDialog('Error: ${e.message}');
//                                 }
//                               }
//                             },
//                             child: const Text('Log In'),
//                           ),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 "Don't have an account?",
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
//                                         builder: (context) => SignUpScreen()),
//                                   );
//                                 },
//                                 child: Text(
//                                   "Sign Up",
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
//                               SizedBox(
//                                 width: 2.w,
//                               )
//                             ],
//                           ),
//                           SizedBox(height: 8.sp),
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Expanded(
//                                   child: Divider(
//                                     indent: 15.sp,
//                                     endIndent: 10.sp,
//                                     thickness: 1,
//                                   ),
//                                 ),
//                               ]),
//                           SizedBox(
//                             height: 2.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               GestureDetector(
//                                 onTap: _handleGoogleSignIn,
//                                 child: CustomLogo(
//                                     onTap: () {
//                                       _handleGoogleSignIn();
//                                     },
//                                     logoName:
//                                         '${AppConstants.assetsImages}google.png'),
//                               ),
//                               SizedBox(
//                                 width: 6.w,
//                               ),
//                               CustomLogo(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => HomeScreen()),
//                                     );
//                                   },
//                                   logoName:
//                                       '${AppConstants.assetsImages}facebook.png'),
//                             ],
//                           )
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