part of 'pokemon_bloc.dart';

@immutable
sealed class PokemonEvent {
  List<Object?> get props => [];
}

class GetUserInfoStorageEvent extends PokemonEvent {
  GetUserInfoStorageEvent();

  @override
  List<Object> get props => [];
}
