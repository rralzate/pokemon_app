import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_app/core/theme/colors.dart';

const colorSchema = ColorScheme(
  brightness: Brightness.light,
  primary: mainBlue,
  onPrimary: mainBlue,
  secondary: secondaryBlue,
  onSecondary: mainBlue,
  error: errorColor,
  onError: errorColor,
  background: mainWhite,
  onBackground: mainGrey,
  surface: mainWhite,
  onSurface: mainGrey,
);

final appTheme = ThemeData(
  primaryColor: mainBlue,
  scaffoldBackgroundColor: mainWhite,
  textTheme: GoogleFonts.assetTextTheme(GoogleFonts.montserratTextTheme()),
  colorScheme: colorSchema.copyWith(error: errorColor),
);
