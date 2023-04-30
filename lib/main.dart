import 'package:flutter/material.dart';
import 'package:uts/Presentations/home_page_screens/pages/BMI.dart';
import 'package:uts/Presentations/intro_screens/onboarding_Screen.dart';
import 'package:uts/Presentations/login_page/login_page.dart';
import 'package:uts/core/app_export.dart';
import 'package:uts/Presentations/intro_screens/onboarding_Screen.dart';
import 'package:uts/localization/app_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      fallbackLocale: Locale('en', 'US'),
      translations: AppLocalization(),
    );
  }
}
