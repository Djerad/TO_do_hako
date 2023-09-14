import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/appcolors.dart';
import 'package:todoapp/features/auth/presentation/screens/onboarding.dart';
import 'package:todoapp/features/auth/presentation/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Appcolor.primary,
        useMaterial3: true,
      ),
      home: OnboardingScreen(),
    );
  }
}
