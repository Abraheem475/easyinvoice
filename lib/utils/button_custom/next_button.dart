import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton {
  Widget nextButton(
      {double? width,
        double? height,
        required VoidCallback onPress,
        required var textColor,required double fontSize,
        var border,var boxShadow,var borderRadius,var icon,
        required String text,required var buttonColor,var iconColor,
        var fontWeight, bool? isIcon}) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          color: buttonColor,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isIcon == true
                  ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(icon,color: iconColor,size: 18,),
              )
                  : const SizedBox(),
              Center(
                  child: Text(
                    text,
                    style: GoogleFonts.poppins(color: textColor,fontSize: fontSize,fontWeight: fontWeight),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
