import 'package:easyinvoice/all_screens/navbar_screen/navbar_screen.dart';
import 'package:easyinvoice/utils/button_custom/next_button.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/colors_class/color_class.dart';


class OnBoardingSlide extends StatelessWidget {
   OnBoardingSlide({
    super.key,
    required this.image,
    required this.textOne,
    required this.textTwo,
    required this.isButton,
  });

  final String image, textOne, textTwo;
  bool isButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,width: double.infinity,height: 240.0,),
          const SizedBox(height: 50.0,),
          Center(
            child:
              TextClass().textClass(fontSize: 16.0, text: textOne,fontWeight: FontWeight.bold,textColor: blackColor),
          ),
          const SizedBox(height: 15.0,),
          TextClass().textClass(text: textTwo, textColor: blackColor, fontSize: 13.0,),
          SizedBox(
            child: isButton
                ? NextButton().nextButton(
              onPress: () {Get.offAll(() => const NavBarBottomScreen());},
              text: "Get Started ",
              textColor: whiteColor,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              buttonColor: appColor,
              borderRadius: BorderRadius.circular(15.0),height: 50.0,)
                : null,
          ),
        ],
      ),
    );
  }
}
