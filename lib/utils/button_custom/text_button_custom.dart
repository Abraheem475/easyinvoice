import 'package:flutter/material.dart';
class TextButtonCustom{
  Widget textButtonCustom({required VoidCallback onPress,required String text,
    required var textColor,    var fontWeight,required double fontSize,}){
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onPress,
        child: Text(text,style: TextStyle(color: textColor,fontWeight: fontWeight,fontSize: fontSize),));
  }
}