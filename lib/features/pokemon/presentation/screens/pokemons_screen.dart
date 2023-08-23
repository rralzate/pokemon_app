import 'package:flutter/material.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/card_pokemon.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Poke APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: const [
        CardPokemon(),
      ]),
    );
  }
}
