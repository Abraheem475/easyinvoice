import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoDesign{
  Widget logoDesign(){
    return Container(
      height: 40.0,
      width: 45.0,
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.all(color: appColor,width: 2.0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text("LOGO",style: GoogleFonts.poppins(color: appColor,fontSize: 10.0),)),
    );
  }
}