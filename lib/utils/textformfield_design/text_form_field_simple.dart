import 'package:flutter/material.dart';

class TextFormFieldSimple{
  Widget textFormFieldSimple({required String fieldName,var width,var controller,var textInputAction,
    required String labelName, var height,
    var keyboardType,var maxLength,var validator}){
    return SingleChildScrollView(
      child: SizedBox(
        height: height,
        width: width,
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          maxLength: maxLength,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            hintText: fieldName,
            label: Text(labelName),
          ),
        ),
      ),
    );
  }
}