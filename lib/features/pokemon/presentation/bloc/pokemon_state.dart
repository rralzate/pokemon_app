part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonState {
  List<Object?> get props => [];
}

final class PokemonInitial extends PokemonState {}

// Class for Get information of the pokemon/// -----------------------------------/// -----------------------------------/// -----------------------------------

class LoadingGetPokemonInfoState extends PokemonState {
  @override
  List<Object?> get props => [];
}

class FailedGetPokemonInfoState extends PokemonState {
  final String error;

  FailedGetPokemonInfoState({required this.error});
  @override
  List<Object?> get props => [error];
}

class GetPokemonInfoState extends PokemonState {
  final List<PokemonEntity> listPokemonEntity;

  GetPokemonInfoState({
    required this.listPokemonEntity,
  });

  @override
  List<Object?> get props => [listPokemonEntity];

  @override
  String toString() {
    return ''' 
      Get Token: 
        Tolken: ${listPokemonEntity.toString()}
    ''';
  }
}

class SuccessGetPokemonInfoState extends PokemonState {
  final List<PokemonEntity> listPokemonEntity;

  SuccessGetPokemonInfoState({
    required this.listPokemonEntity,
  });

  @override
  List<Object?> get props => [
        listPokemonEntity,
      ];
}

/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------

// Class for Get detail information of the pokemon/// -----------------------------------/// -----------------------------------/// -----------------------------------

class LoadingGetPokemonDetailState extends PokemonState {
  @override
  List<Object?> get props => [];
}

class FailedGetPokemonDetailState extends PokemonState {
  final String error;

  FailedGetPokemonDetailState({required this.error});
  @override
  List<Object?> get props => [error];
}

class GetPokemonDetailState extends PokemonState {
  final PokemonDetailEntity pokemonDetailEntity;

  GetPokemonDetailState({
    required this.pokemonDetailEntity,
  });

  @override
  List<Object?> get props => [pokemonDetailEntity];

  @override
  String toString() {
    return ''' 
      Get Token: 
        Tolken: ${pokemonDetailEntity.toString()}
    ''';
  }
}

class SuccessGetPokemonDetailState extends PokemonState {
  final PokemonDetailEntity pokemonDetailEntity;

  SuccessGetPokemonDetailState({
    required this.pokemonDetailEntity,
  });

  @override
  List<Object?> get props => [
        pokemonDetailEntity,
      ];
}

/// -----------------------------------/// -----------------------------------/// -----------------------------------/// -----------------------------------
