import 'package:easyinvoice/utils/button_custom/text_button_custom.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:easyinvoice/utils/textformfield_design/text_form_field_simple.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider_code/items_provider/items_provider.dart';
import '../colors_class/color_class.dart';
import 'items_controller.dart';


class NewItem extends StatelessWidget {
  NewItem({super.key, required this.itemController, this.index = -1});
  ItemController itemController;
  final int index;

  @override
  Widget build(BuildContext context) {
    final addItemProvider = Provider.of<ItemProvider>(context, listen: false);
    if (index != -1) {
      itemController.itemController.text = addItemProvider.items[index];
      itemController.descriptionController.text = addItemProvider.description[index];
      itemController.unitPriceController.text = addItemProvider.unitPrice[index];
      itemController.unitController.text = addItemProvider.unit[index];
      itemController.quantityController.text = addItemProvider.quantity[index];
      itemController.categoryController.text = addItemProvider.category[index];
      (
          double.parse(itemController.unitPriceController.text.toString()) *
              double.parse(itemController.quantityController.text.toString())
      ).toString();
    }

    return Container(
      width: Get.width,
      height: 700.0,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      child: SingleChildScrollView(
        child: Column(
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
                    text: "Add new item",
                    fontSize: 14.0,
                    textColor: appColor,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButtonCustom().textButtonCustom(
                    onPress: () {
                      if (index != -1) {
                        addItemProvider.itemUpdate(
                          index,
                          itemController.itemController.text.toString(),
                          itemController.descriptionController.text.toString(),
                          itemController.unitPriceController.text.toString(),
                          itemController.unitController.text.toString(),
                          itemController.quantityController.text.toString(),
                          itemController.categoryController.text.toString(),
                          (
                              double.parse(itemController.unitPriceController.text.toString()) *
                                  double.parse(itemController.quantityController.text.toString())
                          ).toString(),
                        );
                      }
                      else {addItemProvider.itemAdd(
                        itemController.itemController.text.toString(),
                        itemController.descriptionController.text.toString(),
                        itemController.unitPriceController.text.toString(),
                        itemController.unitController.text.toString(),
                        itemController.quantityController.text.toString(),
                        itemController.categoryController.text.toString(),
                        (
                            double.parse(itemController.unitPriceController.text.toString()) *
                                double.parse(itemController.quantityController.text.toString())
                        ).toString(),
                      );}
                      Get.back();
                    },
                    text: "Save",
                    textColor: appColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormFieldSimple().textFormFieldSimple(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        fieldName: "Item Name",
                        labelName: "Item Name",
                        height: 70.0,
                        width: Get.width,
                        controller: itemController.itemController),
                    TextFormFieldSimple().textFormFieldSimple(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        fieldName: "Description (optional)",
                        labelName: "Description (optional)",
                        height: 70.0,
                        width: Get.width,
                        controller: itemController.descriptionController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormFieldSimple().textFormFieldSimple(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            fieldName: "Unit price",
                            labelName: "Unit price",
                            height:70.0,
                            width: 90.0,
                            controller: itemController.unitPriceController),
                        TextFormFieldSimple().textFormFieldSimple(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            fieldName: "Unit",
                            labelName: "Unit",
                            height: 70.0,
                            width: 90.0,
                            controller: itemController.unitController),
                        TextFormFieldSimple().textFormFieldSimple(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            fieldName: "Quantity",
                            labelName: "Quantity",
                            height: 70.0,
                            width: 90.0,
                            controller: itemController.quantityController),
                      ],
                    ),
                    TextFormFieldSimple().textFormFieldSimple(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.go,
                        fieldName: "Category",
                        labelName: "Category",
                        height: 70.0,
                        width: Get.width,
                        controller: itemController.categoryController),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}