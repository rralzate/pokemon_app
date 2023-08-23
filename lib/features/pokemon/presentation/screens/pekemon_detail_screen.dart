import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/pokemon-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
