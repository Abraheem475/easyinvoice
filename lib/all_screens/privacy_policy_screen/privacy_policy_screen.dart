import 'package:easyinvoice/utils/appbar_code/appbar_code.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PrivacyPolicy{
  Widget privacyPolicy(){
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarCustom().appBarCustom(onPress1: (){Get.back();}, text: "Terms & Conditions", titleColor: whiteColor, backgroundColor: appColor, useLeadingIcon: true),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextClass().textClass(text: "1. Data Collection:",fontSize: 14.0,textColor: blackColor,),
              TextClass().textClass(text: "We only collect the necessary information required to provide our services, such as your name, email address, and billing information, ensuring your privacy at all times.", fontSize: 12.0,textColor: blackColor),

              TextClass().textClass(text: "2. Security Measures:",fontSize:  14.0, textColor: blackColor,),
              TextClass().textClass(text: "Your data is protected with state-of-the-art encryption and security protocols, ensuring that your information remains safe and confidential.",fontSize:  12.0,textColor: blackColor),

              TextClass().textClass(text: "3. Usage Information:",fontSize:  14.0, textColor: blackColor,),
              TextClass().textClass(text: "We may collect anonymous usage data to improve our app's performance and user experience, but rest assured, this data does not personally identify you.",fontSize:  12.0,textColor: blackColor),

              TextClass().textClass(text: "4. Third-Party Services:",fontSize:   14.0, textColor: blackColor,),
              TextClass().textClass(text: "We may integrate third-party services for certain features, but we strictly adhere to their privacy policies to safeguard your information.",fontSize:  12.0,textColor: blackColor),

              TextClass().textClass(text: "5. Purpose of Data:", fontSize:  14.0,textColor:  Colors.black),
              TextClass().textClass(text: "The data we collect is solely used to provide and enhance our services, such as generating invoices and managing accounts, with your explicit consent.",fontSize:  12.0,textColor: blackColor),

              TextClass().textClass(text: "6. Data Sharing:",fontSize:  14.0,textColor: blackColor,),
              TextClass().textClass(text: "We do not sell or share your personal information with third parties for marketing purposes. Your privacy is our top priority.",fontSize:  12.0,textColor: blackColor),

              TextClass().textClass(text: "7. Data Sharing:",fontSize:  14.0,textColor: blackColor,),
              TextClass().textClass(text: "You have full control over your data and can request its deletion or modification at any time through our app's settings or by contacting our support team.",fontSize:  12.0,textColor: blackColor),

              TextClass().textClass(text: "8. Account Security:",fontSize:  14.0, textColor: blackColor, ),
              TextClass().textClass(text: "It's crucial to keep your account credentials secure. We recommend using strong, unique passwords and enabling two-factor authentication for added protection.",fontSize: 12.0,textColor: blackColor),

              TextClass().textClass(text: "9. Children's Privacy:", fontSize:  14.0,textColor: blackColor),
              TextClass().textClass(text: "Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children. ", fontSize: 12.0,textColor: blackColor),


              TextClass().textClass(text: "10. Updates to Privacy Policy:", fontSize:  14.0,textColor: blackColor,),
              TextClass().textClass(text: "We may update our privacy policy from time to time to reflect changes in our practices or applicable laws. You will be notified of any significant changes.", fontSize:  12.0,textColor: blackColor),

              TextClass().textClass(text: "11. Contact Information:",fontSize:  14.0,textColor: blackColor,),
              TextClass().textClass(text: "If you have any questions or concerns regarding your privacy or our privacy policy, please don't hesitate to contact us. We're here to help.", fontSize:  12.0,textColor: blackColor),

              TextClass().textClass(text: "12. Consent:",textColor: blackColor,fontSize:  14.0,),
              TextClass().textClass(text: "By using our Invoice Maker app, you consent to the collection and use of your information as outlined in this privacy policy. Your trust is our greatest reward.", fontSize:  12.0,textColor: blackColor),
            ],
          ),
        ),
      ),
    );
  }
}