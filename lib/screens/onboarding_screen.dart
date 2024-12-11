import 'package:expenz/constance/colors.dart';
import 'package:expenz/data/onboard_screen_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:expenz/widgets/onboard_screen_card.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool showDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  showDetailsPage = value == 3;
                });
              },
              children: [
                const FrontPage(),
                OnBordScreenCard(
                  title: OnbardingData.onboardingList[0].title,
                  imagePath: OnbardingData.onboardingList[0].imagePath,
                  description: OnbardingData.onboardingList[0].description,
                ),
                OnBordScreenCard(
                  title: OnbardingData.onboardingList[1].title,
                  imagePath: OnbardingData.onboardingList[1].imagePath,
                  description: OnbardingData.onboardingList[1].description,
                ),
                OnBordScreenCard(
                  title: OnbardingData.onboardingList[2].title,
                  imagePath: OnbardingData.onboardingList[2].imagePath,
                  description: OnbardingData.onboardingList[2].description,
                ),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.7),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const WormEffect(
                    activeDotColor: kMainColor, dotColor: kLightGrey),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: !showDetailsPage
                      ? GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                                _pageController.page!.toInt() + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut);
                          },
                          child: CustumButton(
                            buttonColor: kMainColor,
                            buttonName:
                                showDetailsPage ? "Get Started" : "Next",
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDataScreen(),
                              ),
                            );
                          },
                          child: CustumButton(
                            buttonColor: kMainColor,
                            buttonName:
                                showDetailsPage ? "Get Started" : "Next",
                          ),
                        ),
                ))
          ]))
        ],
      ),
    );
  }
}
