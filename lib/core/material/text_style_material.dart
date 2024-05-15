import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_material.dart';

class MaterialTextStyle {
  TextStyle menuTitleTextStyle = GoogleFonts.poppins(
      fontSize: 10, fontWeight: FontWeight.w500, color: colorBlack);
  TextStyle smallTextStyle = GoogleFonts.poppins(
      fontSize: 7, fontWeight: FontWeight.w300, color: colorBlack);

  TextStyle smallTextStyleFonSize8 = GoogleFonts.poppins(
      fontSize: 8, fontWeight: FontWeight.w300, color: colorBlack);
  TextStyle smallTextStyleFonSize11 = GoogleFonts.poppins(
      fontSize: 11, fontWeight: FontWeight.w300, color: colorBlack);

  TextStyle smallTextStyleFonSize11Primary = GoogleFonts.poppins(
      fontSize: 11, fontWeight: FontWeight.w300, color: colorPrimary);
  TextStyle smallTextStyleFonSize11White = GoogleFonts.poppins(
      fontSize: 11, fontWeight: FontWeight.w300, color: colorWhite);
  TextStyle smallTextStyleBold = GoogleFonts.poppins(
      fontSize: 7, fontWeight: FontWeight.bold, color: colorBlack);
  TextStyle smallTextStyleBoldprimary = GoogleFonts.poppins(
      fontSize: 7, fontWeight: FontWeight.bold, color: colorPrimary);
  TextStyle smallTextStyleNormalprimary = GoogleFonts.poppins(
      fontSize: 8, fontWeight: FontWeight.normal, color: colorPrimary);
  TextStyle smallTextStyleWhite = GoogleFonts.poppins(
      fontSize: 8, fontWeight: FontWeight.w300, color: colorWhite);
  TextStyle normalTextStyle = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w300, color: colorBlack);

  TextStyle normalTextStyleW500 = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w500, color: colorBlack);
  TextStyle normalTextStylePrimary = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w300, color: colorPrimary);
  TextStyle normalTextStylePrimaryW500 = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w500, color: colorPrimary);
  TextStyle normalTextStyleWhite = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w300, color: colorWhite);
  TextStyle normalTextStyleWhiteW200 = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w200, color: colorWhite);
  TextStyle normalTextStyleWhiteW500 = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w500, color: colorWhite);
  TextStyle formTitleTextStyle = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.bold, color: colorBlack);
  TextStyle formTitleTextStyleGrey = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.bold, color: colorGray);
  TextStyle formTitleTextStylePrimary = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w500, color: colorPrimary);
  TextStyle hintTextTextStyle = GoogleFonts.poppins(
      fontSize: 13, fontWeight: FontWeight.w300, color: colorGray);
  TextStyle largeTextStyle = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.bold, color: colorBlack);
  TextStyle largeTextStylePrimary = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.bold, color: colorPrimary);
  TextStyle largeTextStyleWhite = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.bold, color: colorWhite);
  TextStyle largeTextStyleBlack = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.bold, color: colorBlack);

  TextStyle mediumTextStyleWhite = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, color: colorWhite);
  TextStyle mediumTextStyleBlack = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, color: colorBlack);
  TextStyle mediumTextStyleBlackBold = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.bold, color: colorBlack);
  TextStyle mediumTextStylePrimaryOpacity6 = GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: colorPrimary.withOpacity(.6));
  TextStyle mediumTextStylePrimary = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w400, color: colorPrimary);
  TextStyle mediumTextStylePrimary500 = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w500, color: colorPrimary);
  TextStyle buttonTextStylewhite = GoogleFonts.poppins(
      fontSize: 15, fontWeight: FontWeight.w600, color: colorWhite);

  //Size 50
  TextStyle largeTextStyleBlack30 = GoogleFonts.poppins(
      fontSize: 30, fontWeight: FontWeight.bold, color: colorBlack);
  TextStyle largeTextStyleWhite30 = GoogleFonts.poppins(
      fontSize: 30, fontWeight: FontWeight.bold, color: colorWhite);

  // desainBpjs
  TextStyle styLiatdetail = GoogleFonts.poppins(
    fontSize: 14,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );
}

MaterialTextStyle materialTextStyle = MaterialTextStyle();
