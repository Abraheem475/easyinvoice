import 'dart:io';
import 'package:easyinvoice/all_screens/navbar_screen/navbar_screen.dart';
import 'package:easyinvoice/provider_code/image_provider.dart';
import 'package:easyinvoice/provider_code/provider_singnature/provider_singnature.dart';
import 'package:easyinvoice/provider_code/value_get_provider.dart';
import 'package:easyinvoice/utils/appbar_code/appbar_code.dart';
import 'package:easyinvoice/utils/button_custom/next_button.dart';
import 'package:easyinvoice/utils/card_design/card_design.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/logo_design/logo_design.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../utils/boarder_dotted_design/boarder_dotted_design.dart';
import '../../utils/textformfield_design/textformfield_design.dart';
import '../textformfield_screen_label/textformfield_screen_label.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextEditingController _businessNameController = TextEditingController();
  TextEditingController _businessEmailController = TextEditingController();
  TextEditingController _businessContactController = TextEditingController();
  TextEditingController _businessAddressController = TextEditingController();

  void clearFields() {
    _businessNameController.clear();
    _businessEmailController.clear();
    _businessContactController.clear();
    _businessAddressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustom().appBarCustom(
        leadingIconColor: whiteColor,
        titleColor: whiteColor,
        backgroundColor: appColor,
        text: "Set profile",
        useLeadingIcon: true,
        onPress1: () {
          Get.back();
        },
      ),
      body: Column(
        children: [
          Consumer<ValueGetProvider>(
              builder: (context, valueGetProvider, child) {
            return Container(
              height: 190.0,
              width: 1000.0,
              color: appColor,
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Center(
                    child: Container(
                      width: Get.width * .95,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextClass().textClass(
                                    text: valueGetProvider
                                                .businessName?.isNotEmpty ==
                                            true
                                        ? valueGetProvider.businessName!
                                        : "Company Name",
                                    textColor: blackColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                                Visibility(
                                  visible: true,
                                  child: Center(
                                    child: Consumer<LogoProvider>(
                                      builder: (context, logoProvider, child) {
                                        return GestureDetector(
                                          onTap: () {
                                            logoProvider.pickImage(context);
                                          },
                                          child: logoProvider.logopath ==
                                                  logoProvider.blankImage
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      vertical: 10.0),
                                                  child:
                                                      LogoDesign().logoDesign(),
                                                )
                                              : CircleAvatar(
                                                  radius: 30.0,
                                                  backgroundColor: whiteColor,
                                                  backgroundImage: FileImage(
                                                      File(logoProvider.logopath
                                                          .toString())),
                                                ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Column(
                                  children: [
                                    SizedBox(
                                      height: 60.0,
                                      child: VerticalDivider(
                                        thickness: 2.0,
                                        color: Colors.black,
                                        width: 3.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CardDesign().cardDesign(
                                          iconSize: 18.0,
                                          fontSize: 12.0,
                                          icon: Icons.phone,
                                          text: valueGetProvider.contactNumber
                                                      ?.isNotEmpty ==
                                                  true
                                              ? valueGetProvider.contactNumber!
                                              : "Contact Number",
                                          iconColor: Colors.grey),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      CardDesign().cardDesign(
                                          iconSize: 18.0,
                                          fontSize: 12.0,
                                          icon: Icons.email_outlined,
                                          text: valueGetProvider.businessEmail
                                                      ?.isNotEmpty ==
                                                  true
                                              ? valueGetProvider.businessEmail!
                                              : "Email Address",
                                          iconColor: Colors.grey),
                                      const SizedBox(
                                        height: 3.0,
                                      ),
                                      CardDesign().cardDesign(
                                          iconSize: 18.0,
                                          fontSize: 12.0,
                                          icon: Icons.business_center_outlined,
                                          text: valueGetProvider.businessAddress
                                                      ?.isNotEmpty ==
                                                  true
                                              ? valueGetProvider
                                                  .businessAddress!
                                              : "Business Address",
                                          iconColor: Colors.grey)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            );
          }),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardDesign().cardDesign(
                          iconSize: 27.0,
                          fontSize: 10.5,
                          icon: Icons.lightbulb_outline,
                          text:
                              "67% businessmen saw their business increase after\nsharing their visiting card",
                          iconColor: Colors.amber)
                    ],
                  ),
                ),
                const Divider(
                  thickness: .1,
                  color: Colors.grey,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 7.0, bottom: 7.0),
                  child: Row(
                    children: [
                      TextClass().textClass(
                          text: "Basic Details",
                          textColor: appColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ],
                  ),
                ),
                Divider(
                  thickness: .1,
                  color: Colors.grey,
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
                  child: Consumer<ValueGetProvider>(builder: (context, valueGetProvider, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormFieldDesign().textFormFieldDesign(
                          onChanged: (name) {
                            valueGetProvider.updateTextData(
                              name,
                              valueGetProvider.contactNumber,
                              valueGetProvider.businessEmail,
                              valueGetProvider.businessAddress,
                            );
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          maxLength: 24,
                          controller: _businessNameController,
                          labelText: "Business Name",
                          hintText: "Business Name",
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        TextFormFieldDesign().textFormFieldDesign(
                          onChanged: (no) {
                            valueGetProvider.updateTextData(
                                valueGetProvider.businessName,
                                no,
                                valueGetProvider.businessEmail,
                                valueGetProvider.businessAddress);
                          },
                          textInputAction: TextInputAction.next,
                          maxLength: 14,
                          controller: _businessContactController,
                          keyboardType: TextInputType.phone,
                          labelText: "Phone Number ",
                          hintText: "Phone Number ",),
                        const SizedBox(
                          height: 2.0,
                        ),
                        TextFormFieldDesign().textFormFieldDesign(
                          onChanged: (email) {
                            valueGetProvider.updateTextData(
                                valueGetProvider.businessName,
                                valueGetProvider.contactNumber,
                                email,
                                valueGetProvider.businessAddress);
                          },
                          textInputAction: TextInputAction.next,
                          maxLength: 30,
                          keyboardType: TextInputType.emailAddress,
                          controller: _businessEmailController,

                          labelText: "Email",
                          hintText: "Email",),
                        const SizedBox(
                          height: 2.0,
                        ),
                        TextFormFieldDesign().textFormFieldDesign(
                          onChanged: (address) {
                            valueGetProvider.updateTextData(
                                valueGetProvider.businessName,
                                valueGetProvider.contactNumber,
                                valueGetProvider.businessEmail,
                                address);
                          },
                          textInputAction: TextInputAction.go,
                          maxLength: 37,
                          keyboardType: TextInputType.streetAddress,
                          controller: _businessAddressController,
                          labelText: "Business Address",
                          hintText: "Business Address",),
                        const SizedBox(
                          height: 2.0,
                        ),
                        TextClass().textClass(
                          text: "Signature",
                          textColor: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 10.0,),
                        BorderDottedContainer(),
                        const SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Consumer<ProviderSignature>(builder: (context, signatureProvider, child) {
                              return NextButton().nextButton(
                                onPress: () { signatureProvider.clearSignature(); },
                                text: "Remove",
                                buttonColor: appColor,
                                textColor: whiteColor,
                                fontSize: 11.0,
                                fontWeight: FontWeight.bold,
                                width: 100,
                                height: 40.0,
                                borderRadius: BorderRadius.circular(30),
                              );
                            }),
                          ],
                        ),
                        const SizedBox(height: 20.0,),],);
                  }),),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          NextButton().nextButton(
            onPress: () {
              Provider.of<ValueGetProvider>(context, listen: false)
                  .allClearData();
              Provider.of<ProviderSignature>(context, listen: false)
                  .clearSignature();
              Provider.of<LogoProvider>(context, listen: false).clearImage();
              clearFields();
            },
            text: "Clear",
            buttonColor: whiteColor,
            fontSize: 16.0,
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: 45.0,
            textColor: appColor,
            boxShadow: [BoxShadow(blurRadius: 1, color: Colors.grey.shade400)],
            fontWeight: FontWeight.w500,
          ),
          NextButton().nextButton(
            onPress: () {
              Get.offAll(() => const NavBarBottomScreen());
            },
            text: "Save",
            buttonColor: appColor,
            textColor: whiteColor,
            fontSize: 16.0,
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: 45.0,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
