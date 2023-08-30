import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_app/core/theme/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TextStyle textStyleCardPokemon(Color color) => GoogleFonts.montserratAlternates(
      fontWeight: FontWeight.bold,
      color: color,
      fontSize: Adaptive.sp(17),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyleTitle => GoogleFonts.montserratAlternates(
      color: mainBlack,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(22),
    );

/// This textStyle its for all black Text in the aplication

TextStyle get textBlackStyle => GoogleFonts.montserratAlternates(
      color: mainBlack,
      fontWeight: FontWeight.normal,
      fontSize: Adaptive.sp(15),
    );

/// This textStyle its for all black SubTitle in the aplication

TextStyle get textBlackStyleSubTitle => GoogleFonts.montserratAlternates(
      color: mainBlack,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(18),
    );

/// This textStyle its for all white Text in the aplication

TextStyle get textWhiteStyle => GoogleFonts.montserratAlternates(
      color: mainWhite,
      fontWeight: FontWeight.w600,
      fontSize: Adaptive.sp(14),
    );
