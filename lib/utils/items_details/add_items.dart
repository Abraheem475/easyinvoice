import 'package:easyinvoice/provider_code/clients_provider/client_provider.dart';
import 'package:easyinvoice/provider_code/provider_singnature/provider_singnature.dart';
import 'package:easyinvoice/provider_code/value_get_provider.dart';
import 'package:easyinvoice/utils/button_custom/next_button.dart';
import 'package:easyinvoice/utils/items_details/items_controller.dart';
import 'package:easyinvoice/utils/items_details/total_amount.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../all_screens/create_invoice/preview_invoice.dart';
import '../../provider_code/items_provider/items_provider.dart';
import '../colors_class/color_class.dart';
import 'add_new_item.dart';



class AddItem {
  String? item, description, unitPrice, unit, quantity, category;
  late ItemController formData;
  Widget addItemLine() {
    return Column(
      children: [
        Divider(
          thickness: .5,
          color: appColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              TextClass().textClass(
                  text: "ITEMS",
                  fontSize: 14,
                  textColor: appColor,
                  fontWeight: FontWeight.w600),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Consumer<ItemProvider>(
                  builder: (context, itemProvider, child) {
                    var valueGetProvider = Provider.of<ValueGetProvider>(context,listen: false);
                    var addClientProvider = Provider.of<AddClientProvider>(context,listen: false);
                    var itemProvider = Provider.of<ItemProvider>(context,listen: false);
                    var signatureProvider = Provider.of<ProviderSignature>(context,listen: false);

                    formData = itemProvider.itemController.isNotEmpty
                        ? itemProvider.itemController.first
                        : ItemController();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                                  itemCount: itemProvider.items.length,
                                  itemBuilder: (context, index) {
                                    if (itemProvider.items.isEmpty) {
                                      return Container();
                                    }
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.edit_outlined,color: appColor,size: 20.0,),
                                              onPressed: () {
                                                Get.bottomSheet(backgroundColor: Colors.transparent,
                                                  NewItem(itemController: formData,index: index,),
                                                );
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.delete_outline,color: appColor,size: 20.0,),
                                              onPressed: () {
                                                Provider.of<ItemProvider>(context,listen: false).itemsRemove(index);
                                              },
                                            ),
                                          ],),
                                        Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            TextClass().textClass(text: itemProvider.items[index],
                                              fontSize: 12,
                                              textColor: Colors.black,
                                              fontWeight: FontWeight.w600,),
                                            SizedBox(
                                              width : Get.width/1.33,
                                              child: Row(
                                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                children: [
                                                  TextClass().textClass(
                                                    text:"${itemProvider.unitPrice[index]} x ${itemProvider.quantity[index]}",
                                                    fontSize: 12,
                                                    textColor: Colors.black,
                                                    fontWeight: FontWeight.w600,),
                                                  TextClass().textClass(
                                                    text: formatValue(double.parse(itemProvider.perItemTotalAmount[index].toString())),
                                                    fontSize: 12,
                                                    textColor: blackColor,),
                                                ],
                                              ),
                                            ),
                                            TextClass().textClass(
                                              text:itemProvider.description[index],
                                              fontSize: 13,
                                              textColor: blackColor,),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.bottomSheet(
                                    backgroundColor: Colors.transparent,
                                    isDismissible: false,
                                    NewItem(itemController: formData,),
                                  );
                                },
                                child: TextClass().textClass(
                                    fontSize: 14,
                                    textColor: appColor,
                                    text: "+ ADD NEW ITEMS",
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Divider(thickness: .5,color: appColor),
                        TotalAmount().totalAmount(),
                        Divider(thickness: .5,color: appColor,),
                        const SizedBox(height: 20.0,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              NextButton().nextButton(
                                  onPress: () {
                                    Get.to(() => PreviewInvoice(
                                      companyName:valueGetProvider.businessName,
                                      companyAddress:valueGetProvider.businessAddress,
                                      companyEmail:valueGetProvider.businessEmail,
                                      companyContact:valueGetProvider.contactNumber,
                                      clientName:addClientProvider.name,
                                      clientEmail:addClientProvider.email,
                                      clientMobile:addClientProvider.mobile,
                                      clientAddress:addClientProvider.address,
                                      itemList:itemProvider.items,
                                      priceList:itemProvider.unitPrice,
                                      quantityList:itemProvider.quantity,
                                      perItemTotalList:itemProvider.perItemTotalAmount,
                                      signatureBytes:signatureProvider.signatureBytes,
                                      total:itemProvider.totalCalculate(),
                                    ));
                                  },
                                  text: "SAVE AND NEXT",
                                  buttonColor: appColor,
                                  textColor: whiteColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  width: Get.width,
                                  height: 50.0,
                                  borderRadius: BorderRadius.circular(10))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      ],
    );
  }

  String formatValue(double value) {
    return value.toStringAsFixed(2);
  }
}
