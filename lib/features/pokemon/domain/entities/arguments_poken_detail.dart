import 'package:pokemon_app/features/pokemon/presentation/bloc/pokemon_bloc.dart';

class ArgumentsPokemonDetailScreen {
  final String pokemonName;
  final PokemonBloc pokemonBloc;

  ArgumentsPokemonDetailScreen({
    required this.pokemonName,
    required this.pokemonBloc,
  });
}
