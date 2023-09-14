import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todoapp/core/databse/cashhelper.dart';
import 'package:todoapp/core/services/services_locator.dart';
import 'package:todoapp/core/utils/appassets.dart';
import 'package:todoapp/core/utils/appcolors.dart';
import 'package:todoapp/core/utils/appstrings.dart';
import 'package:todoapp/features/auth/presentation/screens/home.dart';
import 'package:todoapp/features/auth/presentation/screens/splashscreen.dart';

class OnboardingScreen extends StatelessWidget {
  PageController _pageController = PageController();
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor.primary,
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                      onTap: () {
                        _pageController.jumpToPage(2);
                      },
                      child: Text(
                        "Skip",
                        style: GoogleFonts.lato(
                            color: Appcolor.grey,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: Onboardingmodel.lisyonboarding.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                        height: 300,
                        width: 200,
                        child: Image.asset(
                          Onboardingmodel.lisyonboarding[index].image,
                        )),
                    SmoothPageIndicator(
                        controller: _pageController, // PageController
                        count: 3,
                        effect: const WormEffect(), // your preferred effect
                        onDotClicked: (index) {}),
                    Text(
                      Onboardingmodel.lisyonboarding[index].title,
                      style: GoogleFonts.lato(
                          color: Appcolor.grey,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      Onboardingmodel.lisyonboarding[index].sub,
                      style: GoogleFonts.lato(
                          color: Appcolor.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          index != 0
                              ? TextButton(
                                  onPressed: () {
                                    _pageController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 900),
                                        curve: Curves.easeInOut);
                                  },
                                  child: const Text("Back"))
                              : Container(),
                          index != 2
                              ? MaterialButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 900),
                                        curve: Curves.easeInOut);
                                  },
                                  color: Appcolor.purple,
                                  child: const Text("Continue"))
                              : MaterialButton(
                                  onPressed: () async {
                                    print("hhhhhhhhh");
                                    await sl<CashHelper>().savedata(
                                        key: "onboarding", value: true);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               Homepage()),
                                    );
                                    _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 900),
                                        curve: Curves.easeInOut);
                                  },
                                  color: Appcolor.purple,
                                  child: const Text("Get Started"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}

class Onboardingmodel {
  final String image;
  final String title;
  final String sub;
  Onboardingmodel(
      {required this.image, required this.title, required this.sub});
  static List<Onboardingmodel> lisyonboarding = [
    Onboardingmodel(
        image: Appassets.onboar1,
        title: Appstrings.title1onboarding,
        sub: Appstrings.body1onboarding),
    Onboardingmodel(
        image: Appassets.onboar2,
        title: Appstrings.title2onboarding,
        sub: Appstrings.body2onboarding),
    Onboardingmodel(
        image: Appassets.onboar1,
        title: Appstrings.title1onboarding,
        sub: Appstrings.body1onboarding),
    Onboardingmodel(
        image: Appassets.onboar3,
        title: Appstrings.title3onboarding,
        sub: Appstrings.body3onboarding),
  ];
}
