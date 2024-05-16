import 'package:easyinvoice/utils/appbar_code/appbar_code.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicy {
  Widget privacyPolicy() {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBarCustom().appBarCustom(
        onPress1: () { Get.back(); },
        text: "Privacy Policy",
        titleColor: whiteColor,
        backgroundColor: appColor,
        useLeadingIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextClass().textClass(
                text: "1. Data Collection:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "We collect only the necessary information to provide our services, including your name, email address, and billing details, ensuring your privacy is always protected.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "2. Security Measures:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "Your data is secured with advanced encryption and security protocols to ensure it remains safe and confidential.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "3. Usage Information:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "We may collect anonymous usage data to enhance our app's performance and user experience. This data does not personally identify you.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "4. Third-Party Services:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "We may integrate third-party services for certain features, adhering strictly to their privacy policies to protect your information.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "5. Purpose of Data:",
                fontSize: 14.0,
                textColor: Colors.black,
              ),
              TextClass().textClass(
                text: "The data we collect is used solely to provide and improve our services, such as generating invoices and managing accounts, with your explicit consent.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "6. Data Sharing:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "We do not sell or share your personal information with third parties for marketing purposes. Your privacy is our top priority.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "7. Data Control:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "You have full control over your data and can request its deletion or modification at any time through our app's settings or by contacting our support team.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "8. Account Security:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "It's essential to keep your account credentials secure. We recommend using strong, unique passwords and enabling two-factor authentication for added protection.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "9. Children's Privacy:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "10. Updates to Privacy Policy:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "We may update our privacy policy from time to time to reflect changes in our practices or applicable laws. You will be notified of any significant changes.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "11. Contact Information:",
                fontSize: 14.0,
                textColor: blackColor,
              ),
              TextClass().textClass(
                text: "If you have any questions or concerns about your privacy or our privacy policy, please contact us. We're here to help.",
                fontSize: 12.0,
                textColor: blackColor,
              ),

              TextClass().textClass(
                text: "12. Consent:",
                textColor: blackColor,
                fontSize: 14.0,
              ),
              TextClass().textClass(
                text: "By using our Invoice Maker app, you consent to the collection and use of your information as outlined in this privacy policy. Your trust is our greatest reward.",
                fontSize: 12.0,
                textColor: blackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
