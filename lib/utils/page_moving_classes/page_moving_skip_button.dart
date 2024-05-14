import 'package:easyinvoice/all_screens/navbar_screen/navbar_screen.dart';
import 'package:easyinvoice/utils/button_custom/text_button_custom.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageMovingSkipButton {
  Widget pageMovingSkipButton() {
    return Positioned(
        top: 15,
        right: 15,
        child: TextButtonCustom().textButtonCustom(
            onPress: () {Get.offAll(NavBarBottomScreen());},
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          text: "Skip",textColor: appColor,));
  }
}