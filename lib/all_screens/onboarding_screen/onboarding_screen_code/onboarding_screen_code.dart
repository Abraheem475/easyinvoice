import 'package:easyinvoice/utils/page_moving_classes/page_moving_controller.dart';
import 'package:easyinvoice/utils/page_moving_classes/page_moving_skip_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/images_path/images_path.dart';
import '../../../utils/page_moving_classes/page_moving_slider.dart';
import '../onboarding_page_class/onboarding_page_class.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int totalPages = 3;
    final pageController = Get.put(PageMovingController(totalPages));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
        PageView(
        controller: pageController.pageController,
        onPageChanged: pageController.updateMovingPageIndicator,
        children:  [
          OnBoardingSlide(
            image: ImagePath.onboardingScreenOne,
           textOne: "Your Invoices, Your Way, Anywhere!",
            textTwo: "", isButton: false,
          ),
          OnBoardingSlide(
            image: ImagePath.onboardingScreenTwo,
            textOne: "Streamlined Receipt Creation Made Fast and Simple!",
            textTwo: "Cut down on time and tension, Produce endless invoices effortlessly with Easy Invoice Maker.", isButton: false,
          ),
          OnBoardingSlide(
            image: ImagePath.onboardingScreenThree,
            textOne: "All-in-One Invoicing \nSolution",
            textTwo: "Send invoices to clients in a snap, keep a real-time eye on Payments, or delve into comprehensive client history.", isButton: true,
          ),
        ],
      ),
         PageMovingSkipButton().pageMovingSkipButton(),
          const Align(
              alignment: Alignment.bottomCenter,
              child: PageMovingSlider()),
    ]));
  }
}
