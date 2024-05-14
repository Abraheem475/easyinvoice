import 'package:easyinvoice/provider_code/value_get_provider.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/items_details/add_items.dart';
import 'package:easyinvoice/utils/appbar_code/appbar_code.dart';
import 'package:easyinvoice/utils/button_custom/next_button.dart';
import 'package:easyinvoice/utils/clients_details/add_client_info.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../profile_screen/profile_screen.dart';



class CreateInvoice extends StatelessWidget {

  CreateInvoice({super.key, required this.businessName,required  this.businessEmail});
  String businessName, businessEmail;
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessEmailController = TextEditingController();
  final TextEditingController _businessContactController = TextEditingController();
  final TextEditingController _businessAddressController = TextEditingController();

  void clearFields() {
    _businessNameController.clear();
    _businessEmailController.clear();
    _businessContactController.clear();
    _businessAddressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final valueGetProvider = Provider.of<ValueGetProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar:
          AppBarCustom().appBarCustom(onPress1: (){Get.back();}, text: "Create Invoice", titleColor: whiteColor, backgroundColor: appColor, useLeadingIcon: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextClass().textClass(text:  valueGetProvider.businessName?.isNotEmpty == true
                          ? valueGetProvider.businessName!
                          : "Company Name", fontSize: 14.0,textColor: Colors.black,fontWeight: FontWeight.bold),
                      const SizedBox(height: 5.0,),
                      TextClass().textClass(text: valueGetProvider.businessEmail?.isNotEmpty == true
                          ? valueGetProvider.businessEmail!
                          : "Email Address", fontSize: 12.0,textColor: blackColor,),
                    ],
                  ),
                  Row(children: [
                    NextButton().nextButton(onPress: (){Get.to(() => ProfileScreen());},
                        text: "Set Profile", textColor: whiteColor, fontSize: 14.0,fontWeight: FontWeight.bold,height: 40.0,width: 100.0,buttonColor: appColor),],
                  ),],),),
            Divider(thickness: .5,color: appColor,),
            AddClientInfo().addClientInfo(),
            const SizedBox(height: 10.0,),
            AddItem().addItemLine(),
          ],
        ),
      ),
    );
  }
}
