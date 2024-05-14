import 'dart:async';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/images_path/images_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onboarding_screen/onboarding_screen_code/onboarding_screen_code.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  void timerFunction(){
    Timer(const Duration(seconds: 5), () {
      Get.to( ()=> const OnBoardingScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    timerFunction();
    return Scaffold(
      backgroundColor: appColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                padding: const EdgeInsets.all(10.0),
                width: 200.0,
                height: 200.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(ImagePath.splashLogo,)),),
          const SizedBox(height: 15.0,),
          Center(
            child: Text("Easy Invoice Maker",
              style: TextStyle(color: whiteColor,fontSize: 20.0,fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
