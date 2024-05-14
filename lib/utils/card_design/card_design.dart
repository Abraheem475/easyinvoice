
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';


class CardDesign{
  Widget cardDesign({required double iconSize,required double fontSize,required var icon,required String text,required var iconColor}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon,color: iconColor,size: iconSize,),
        const SizedBox(width: 5,),
        TextClass().textClass(text: text,textColor:  blackColor,fontSize: 10.5),
      ],
    );
  }
}