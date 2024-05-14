import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider_code/items_provider/items_provider.dart';
import '../colors_class/color_class.dart';


class TotalAmount {
  Widget totalAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextClass().textClass(
                  fontSize: 13,
                  textColor: Colors.black,
                  text: "Subtotal",
                  fontWeight: FontWeight.w600),
              const SizedBox(
                width: 67.0,
              ),
              Consumer<ItemProvider>(
                  builder: (context, itemProvider, child) {
                    return TextClass().textClass(
                        text: itemProvider.totalCalculate().toString(),
                        fontSize: 13.0,
                        textColor: Colors.black,
                        fontWeight: FontWeight.w600);
                  }),
            ],
          ),
          SizedBox(
              width: Get.width * .48,
              child: Divider(thickness: .2,color: appColor,)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextClass().textClass(
                  fontSize: 13,
                  textColor: Colors.black,
                  text: "Total",
                  fontWeight: FontWeight.w600),
              const SizedBox(
                width: 70.0,
              ),
              Consumer<ItemProvider>(
                  builder: (context, itemProvider, child) {
                    return TextClass().textClass(
                        text: itemProvider.totalCalculate().toString(),
                        fontSize: 13.0,
                        textColor: Colors.black,
                        fontWeight: FontWeight.w600);
                  }),
            ],
          ),
          SizedBox(
              width: Get.width * .41,
              child: Divider(thickness: .2,color: appColor,)),
        ],
      ),
    );
  }
}