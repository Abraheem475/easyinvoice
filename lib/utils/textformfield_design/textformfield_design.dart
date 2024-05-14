import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';

class TextFormFieldDesign{
  Widget textFormFieldDesign({var keyboardType,var maxLength,var initialValue,var onChanged,required String labelText,required String hintText,var textInputAction,var controller}){
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      initialValue: initialValue,
      textInputAction: textInputAction,
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        label:TextClass().textClass(text: labelText,textColor:  Colors.grey.shade500,fontWeight:  FontWeight.w400,fontSize:  14),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(10),
        ),

      ),
    );
  }
}