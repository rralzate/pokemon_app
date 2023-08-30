import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/core/usescases/usescases.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/features/pokemon/domain/usescases/get_pokemon_list_usecase.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  GetPokemonListUseCase getPokemonListUseCase;
  PokemonBloc({
    required this.getPokemonListUseCase,
  }) : super(PokemonInitial()) {
    on<GetUserInfoStorageEvent>((event, emit) async {
      emit(
        await _getPokemonList(
          event: event,
          emit: emit,
        ),
      );
    });
  }
  Future<PokemonState> _getPokemonList({
    required GetUserInfoStorageEvent event,
    required Emitter<PokemonState> emit,
  }) async {
    emit(LoadingGetPokemonInfoState());

    final pokemon = await getPokemonListUseCase(NoParams());

    return pokemon.fold((failure) {
      emit(FailedGetPokemonInfoState(
          error:
              failure.props.isNotEmpty ? failure.props.first.toString() : ''));

      return GetPokemonInfoState(
        listPokemonEntity: const [],
      );
    }, (response) {
      emit(SuccessGetPokemonInfoState(listPokemonEntity: response));

      return GetPokemonInfoState(listPokemonEntity: response);
    });
  }
}
