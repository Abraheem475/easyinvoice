import 'package:easyinvoice/utils/page_moving_classes/page_moving_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../colors_class/color_class.dart';

class PageMovingSlider extends StatelessWidget {
  const PageMovingSlider({super.key,});

  @override
  Widget build(BuildContext context) {
    final pageController = PageMovingController.instance;
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: SmoothPageIndicator(
        controller: pageController.pageController,
        count: 3,
        onDotClicked: pageController.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: appColor,
          dotColor: lightAppColor,
          dotWidth: 8.0,
          dotHeight: 8.0,
        ),
      ),
    );
  }
}
