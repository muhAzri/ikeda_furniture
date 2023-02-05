import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;

Color primaryTextColor = const Color(0xff495057);
Color secondaryTextColor = const Color(0xff7B756F);
Color primaryColor = const Color(0xffFEA763);
Color whiteColor = const Color(0xffF8F8F8);
Color backgroundColor = const Color(0xffF9F9F9);

TextStyle primaryTextStyle = GoogleFonts.montserrat(
  color: primaryTextColor,
);

TextStyle whiteTextStyle = GoogleFonts.montserrat(
  color: whiteColor,
);

TextStyle secondaryTextStyle = GoogleFonts.montserrat(
  color: secondaryTextColor,
);

TextStyle priceTextStyle = GoogleFonts.montserrat(
  color: primaryColor,
);
