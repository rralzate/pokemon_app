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
