import 'package:flutter/material.dart';
import 'package:pokemon_app/core/routes/page_generator.dart';
import 'package:pokemon_app/core/theme/app_theme.dart';

import 'features/pokemon/presentation/screens/pokemons_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: appTheme,
      initialRoute: PokemonsScreen.routeName,
      onGenerateRoute: PageGenerator.getNamedScreen,
    );
  }
}
