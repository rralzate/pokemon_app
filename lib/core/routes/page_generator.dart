import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/arguments_poken_detail.dart';
import 'package:pokemon_app/features/pokemon/presentation/screens/pekemon_detail_screen.dart';
import 'package:pokemon_app/features/pokemon/presentation/screens/pokemons_screen.dart';

/// It is a class that allows you to manipulate screen navigation without losing instances and references of elements
/// in the navigation tree in order to persist the navigation structure and user experience.
class PageGenerator {
  /// This method is for global  generics screens navigation routes
  static Route<dynamic> getNamedScreen(RouteSettings routeSettings) {
    Widget Function(BuildContext) builder;

    switch (routeSettings.name) {
      case PokemonsScreen.routeName:
        builder = (context) => const PokemonsScreen();
        break;
      case PokemonDetailScreen.routeName:
        builder = (context) => PokemonDetailScreen(
              paramPokemonDetail:
                  routeSettings.arguments as ArgumentsPokemonDetailScreen,
            );
        break;
      default:
        builder = (context) => const Material(
              child: Center(child: Text('Todavia no se ha implementado')),
            );
    }

    return _commonPageWrapper(
      builder: builder,
      routeSettings: routeSettings,
    );
  }

  /// Configuration method to create our own navigation
  static Route<dynamic> _commonPageWrapper({
    required RouteSettings routeSettings,
    required Widget Function(BuildContext) builder,
  }) {
    return MaterialWithModalsPageRoute(
        settings: routeSettings,
        builder: (context) => Container(
              color: Colors.black.withOpacity(0.4),
              child: SafeArea(
                top: false,
                bottom: false,
                child: builder(context),
              ),
            ));
  }
}
