import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCustom {
  AppBar appBarCustom({
    required VoidCallback onPress1,
    required String text, var leadingIconColor,
    var icon,required var titleColor,
    required var backgroundColor,
    required bool useLeadingIcon, }) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: useLeadingIcon
          ? IconButton(
        onPressed: onPress1,
        icon: Icon(Icons.arrow_back_outlined, color: leadingIconColor),
      )
          : null,
      automaticallyImplyLeading: false,
      title: Text(text,style: GoogleFonts.poppins(color: titleColor,fontSize: 17.0,),
      ),
    );
  }
}
