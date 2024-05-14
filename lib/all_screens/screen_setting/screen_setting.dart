import 'package:easyinvoice/utils/appbar_code/appbar_code.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../privacy_policy_screen/privacy_policy_screen.dart';



class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarCustom().appBarCustom(onPress1: (){}, text: "Setting", titleColor: whiteColor, backgroundColor: appColor, useLeadingIcon: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
        child: GestureDetector(
          onTap: (){
            Get.to(PrivacyPolicy().privacyPolicy());
            },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              tileColor: appColor,
              leading: Icon(Icons.privacy_tip_outlined,color: whiteColor,size: 20.0,),
              title:TextClass().textClass(text: "Privacy Policy",textColor:  whiteColor,fontWeight:  FontWeight.bold,fontSize:  14.0),
              trailing: IconButton(onPressed: (){
                Get.to(PrivacyPolicy().privacyPolicy());
                }, icon: Icon(Icons.arrow_forward_ios_outlined,color: whiteColor,size: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
