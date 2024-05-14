import 'package:dotted_border/dotted_border.dart';
import 'package:easyinvoice/utils/text_class/text_class.dart';
import 'package:flutter/material.dart';

import '../colors_class/color_class.dart';


class DottedBox{
  Widget dottedBox({required String text,required double width, required double height,}){
    return DottedBorder(color: appColor,
        dashPattern: const [9, 5],
        strokeWidth: 1.6,
        child:SizedBox(
          height: height,
          width: width,
          child: Center(child: TextClass().textClass(textColor: appColor,text: text, fontSize: 12.0,)),
        ) );
  }
}