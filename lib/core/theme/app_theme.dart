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
  background: Colors.black,
  onBackground: mainGrey,
  surface: mainWhite,
  onSurface: mainGrey,
);

const appBarTheme = AppBarTheme(
  backgroundColor: mainBlack,
  elevation: 0,
  centerTitle: true,
);

final appTheme = ThemeData(
  primaryColor: mainBlue,
  scaffoldBackgroundColor: mainBlack,
  textTheme: GoogleFonts.assistantTextTheme(GoogleFonts.montserratTextTheme()),
  colorScheme: colorSchema.copyWith(error: errorColor),
  appBarTheme: appBarTheme,
);
