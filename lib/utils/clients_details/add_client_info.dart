import 'package:easyinvoice/provider_code/clients_provider/client_provider.dart';
import 'package:easyinvoice/utils/boarder_dotted_design/dotted_box.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../colors_class/color_class.dart';
import 'client_bottom_sheet.dart';

class AddClientInfo {

  Padding addClientInfo() {
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextClass().textClass(
            fontSize: 14,
            textColor: appColor,
            text: "BILL TO",
            fontWeight: FontWeight.w600),
        const SizedBox(
          height: 10.0,
        ),
        Consumer<AddClientProvider>(
            builder: (context, clientListProvider, child) {
              Provider.of<AddClientProvider>(context,listen: false);
              return GestureDetector(
                onLongPress: (){clientListProvider.clearData();},
                onTap: () {
                  Get.bottomSheet(
                      backgroundColor: Colors.transparent,
                      isDismissible: false,
                      AddClientBottomSheet().addClientBottomSheet());
                },
                child: clientListProvider.name == null
                    ? DottedBox().dottedBox(
                    text: "+ Add client", height: 50.0, width: 150.0)
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextClass().textClass(
                            text: clientListProvider.name,
                            fontSize: 12.0,
                            textColor: Colors.black,
                            fontWeight: FontWeight.w600),
                        TextClass().textClass(
                          text: clientListProvider.email,
                          fontSize: 12.0,
                          textColor: blackColor,
                          // fontWeight: FontWeight.w600
                        ),
                        TextClass().textClass(
                          text: clientListProvider.address,
                          fontSize: 12.0,
                          textColor: blackColor,
                          // fontWeight: FontWeight.w600
                        ),
                        TextClass().textClass(
                          text: clientListProvider.mobile,
                          fontSize: 12.0,
                          textColor: blackColor,
                          // fontWeight: FontWeight.w600
                        ),
                        TextClass().textClass(
                          text: clientListProvider.phone,
                          fontSize: 12.0,
                          textColor: blackColor,),
                      ],
                    ),
                    const SizedBox(width: 0.0,height: 0.0,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextClass().textClass(
                            text: "INVOICE INFO",
                            fontSize: 14,
                            textColor: appColor,
                            fontWeight: FontWeight.w600),
                        TextClass().textClass(
                          text: "Date: $formattedDate",
                          fontSize: 12.0,
                          textColor: blackColor,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ]),
    );
  }
}