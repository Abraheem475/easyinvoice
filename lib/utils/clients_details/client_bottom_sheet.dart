import 'package:easyinvoice/provider_code/clients_provider/client_provider.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:easyinvoice/utils/textformfield_design/text_form_field_simple.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../button_custom/text_button_custom.dart';


class AddClientBottomSheet {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var mobileController = TextEditingController();
  var phoneController = TextEditingController();
  var faxController = TextEditingController();

  Container addClientBottomSheet() {
    return Container(
      width: Get.width,
      height: 700.0,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {Get.back();},
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: appColor,
                      )),
                  TextClass().textClass(
                    text: "Add new client",
                    fontSize: 14.0,
                    textColor: appColor,
                    fontWeight: FontWeight.bold,
                  ),
                  Consumer<AddClientProvider>(
                      builder: (context, provider, child) {
                        return TextButtonCustom().textButtonCustom(
                          onPress: () {
                            provider.clientAdd(
                                nameController.text.toString(),
                                emailController.text.toString(),
                                addressController.text.toString(),
                                mobileController.text.toString(),
                                phoneController.text.toString());
                            Get.back();},
                          text: "Save",
                          fontWeight: FontWeight.bold,
                          textColor: appColor,
                          fontSize: 14.0,
                        );
                      }),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormFieldSimple().textFormFieldSimple(
                      keyboardType: TextInputType.name,
                      maxLength: 20,
                      width: Get.width,
                      height: 80.0,
                      controller: nameController,
                    textInputAction: TextInputAction.next,
                    fieldName: "Name",
                    labelName: "Name",),
                  TextFormFieldSimple().textFormFieldSimple(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: emailController,
                    fieldName: "Email",
                    labelName: "Email",
                    height: 80.0,
                    maxLength: 28,
                    width: Get.width,),
                  TextFormFieldSimple().textFormFieldSimple(
                      keyboardType: TextInputType.streetAddress,
                      textInputAction: TextInputAction.next,
                      fieldName: "Address",
                      width: Get.width,
                      controller: addressController,
                    labelName: "Address",
                    height: 80.0,
                    maxLength: 28,) ,
                 TextFormFieldSimple().textFormFieldSimple(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      fieldName: "Mobile (optional)",
                      labelName: "Mobile (optional)",
                      height: 80.0,
                      width: Get.width,
                      maxLength: 12,
                      controller: mobileController),
                TextFormFieldSimple().textFormFieldSimple(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      fieldName: "Phone (optional)",
                      width: Get.width,
                      controller: phoneController,
                    labelName: "Phone (optional)",
                    height: 80.0,
                    maxLength: 12,) ,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
