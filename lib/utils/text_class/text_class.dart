import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextClass{
  Widget textClass({var fontWeight,required double fontSize,required String text,var textColor,var textAlign}){
    return Text(text,textAlign: textAlign,
      style: GoogleFonts.poppins(fontWeight: fontWeight,fontSize: fontSize, color: textColor,),);
  }
}
