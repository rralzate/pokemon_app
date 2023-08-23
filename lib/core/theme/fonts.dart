import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TextStyle textStyleCardPokemon(Color color) => GoogleFonts.montserratAlternates(
      fontWeight: FontWeight.bold,
      color: color,
      fontSize: Adaptive.sp(17),
    );
