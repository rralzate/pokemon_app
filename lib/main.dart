import 'package:flutter/material.dart';
import 'package:pokemon_app/core/routes/page_generator.dart';
import 'package:pokemon_app/core/theme/app_theme.dart';
import 'package:pokemon_app/injection_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'features/pokemon/presentation/screens/pokemons_screen.dart';

Future<void> main() async {
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pokemon App',
          theme: appTheme,
          initialRoute: PokemonsScreen.routeName,
          onGenerateRoute: PageGenerator.getNamedScreen,
        );
      },
    );
  }
}
