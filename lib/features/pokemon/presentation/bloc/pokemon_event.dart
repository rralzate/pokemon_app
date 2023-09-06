part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonEvent {
  List<Object?> get props => [];
}

class GetPokemonsInfoEvent extends PokemonEvent {
  GetPokemonsInfoEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonDetailInfoEvent extends PokemonEvent {
  final String pokemonName;

  GetPokemonDetailInfoEvent({required this.pokemonName});

  @override
  List<Object> get props => [];
}
