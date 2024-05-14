import 'package:flutter/cupertino.dart';

class ItemController{
  TextEditingController itemController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();
  TextEditingController unitController = TextEditingController();

  Map<String, String> toMap() {
    return {
      "Item": itemController.text.toString(),
      "Description": descriptionController.text.toString(),
      "Category": categoryController.text.toString(),
      "UnitPrice": unitPriceController.text.toString(),
      "Unit": unitController.text.toString(),
      "Quantity": quantityController.text.toString(),
    };
  }
}