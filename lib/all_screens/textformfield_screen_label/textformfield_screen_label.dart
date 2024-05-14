import 'package:easyinvoice/provider_code/provider_singnature/provider_singnature.dart';
import 'package:easyinvoice/provider_code/value_get_provider.dart';
import 'package:easyinvoice/utils/button_custom/next_button.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/boarder_dotted_design/boarder_dotted_design.dart';
import '../../utils/textformfield_design/textformfield_design.dart';

class TextFormFieldLabel{

  TextEditingController _businessNameController = TextEditingController();
  TextEditingController _businessEmailController = TextEditingController();
  TextEditingController _businessContactController = TextEditingController();
  TextEditingController _businessAddressController = TextEditingController();
  Widget textFormFieldLabel(){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 7.0),
      child: Consumer<ValueGetProvider>(builder: (context, valueGetProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormFieldDesign().textFormFieldDesign(labelText: "Business Name", hintText: "Business Name",
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
              controller: _businessNameController,),
            const SizedBox(
              height: 2.0,
            ),
            TextFormFieldDesign().textFormFieldDesign(labelText: "Phone Number ", hintText: "Phone Number ",
              onChanged: (no) {
                valueGetProvider.updateTextData(
                  valueGetProvider.businessName,
                  valueGetProvider.businessEmail,
                  no,
                  valueGetProvider.businessAddress,
                );
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              maxLength: 24,
              controller: _businessContactController,),
            const SizedBox(
              height: 2.0,
            ),
            TextFormFieldDesign().textFormFieldDesign(labelText: "Email", hintText: "Email",
              onChanged: (email) {
                valueGetProvider.updateTextData(
                  valueGetProvider.businessName,
                  valueGetProvider.contactNumber,
                  email,
                  valueGetProvider.businessAddress,
                );
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              maxLength: 24,
              controller: _businessEmailController,),
            const SizedBox(
              height: 2.0,
            ),
            TextFormFieldDesign().textFormFieldDesign(labelText: "Business Address", hintText: "Business Address",
              onChanged: (address) {
                valueGetProvider.updateTextData(
                  valueGetProvider.businessName,
                  valueGetProvider.contactNumber,
                  valueGetProvider.businessEmail,
                    address,
                );
              },
              textInputAction: TextInputAction.go,
              keyboardType:TextInputType.streetAddress,
              maxLength: 24,
              controller: _businessAddressController,),
            const SizedBox(
              height: 2.0,
            ),
            TextClass().textClass(text: "Signature",textColor: blackColor,fontWeight:  FontWeight.w600,fontSize:  14.0),
            const SizedBox(height: 10.0,),
            BorderDottedContainer(),
            const SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<ProviderSignature>(builder: (context, providerSignature, child) {
                  return
                    NextButton().nextButton(onPress: (){
                      providerSignature.clearSignature();
                    }, textColor: appColor, fontSize: 11.0,fontWeight: FontWeight.bold,
                        width: 100,
                        height: 40.0,
                        borderRadius: BorderRadius.circular(30), text: "Remove", buttonColor: whiteColor);
                }),
              ],
            ),
            const SizedBox(height: 20.0,),],);
      }),);
  }
}