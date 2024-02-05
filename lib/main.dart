import 'package:dameer_collection/Providers/custom_theme_provider.dart';
import 'package:dameer_collection/Routes/app_Navigation.dart';
import 'package:dameer_collection/Screens/Homepage/homepage.dart';
import 'package:dameer_collection/Screens/Welcome/welcome.dart';
import 'package:dameer_collection/Utils/aap_theme.dart';
import 'package:dameer_collection/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dameer_collection/Routes/route_generator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider<CustomThemeProvider>(
    create: (context) => CustomThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Dameer\'s Collection',
        debugShowCheckedModeBanner: false,
        theme: Provider.of<CustomThemeProvider>(context).currentTheme,
        darkTheme: AppThemes.dark,
        navigatorKey: AppNavigation.navigationKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const homepage();
              } else {
                return const welcome();
              }
            }),
      );
    });
  }
}
