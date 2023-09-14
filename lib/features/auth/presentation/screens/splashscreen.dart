import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/databse/cashhelper.dart';
import 'package:todoapp/core/utils/appassets.dart';
import 'package:todoapp/core/utils/appcolors.dart';
import 'package:todoapp/core/utils/appstrings.dart';
import 'package:todoapp/features/auth/presentation/screens/home.dart';
import 'package:todoapp/features/auth/presentation/screens/onboarding.dart';

import '../../../../core/services/services_locator.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() {
    bool isvisited = sl<CashHelper>().getdata(key: "onboarding") ?? false;
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isvisited ?  Homepage():OnboardingScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            Appassets.logoapp,
          )),
          const SizedBox(
            height: 10,
          ),
          Text(
            Appstrings.appname,
            style: GoogleFonts.lato(
                color: Appcolor.white,
                fontSize: 35,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
