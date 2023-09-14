import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/utils/appassets.dart';
import 'package:todoapp/core/utils/appcolors.dart';
import 'package:todoapp/core/utils/appstrings.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            Appassets.onboar1,
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
