import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_app/core/usescases/usescases.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/crystal.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/dream_world.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/generation_ii.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/generation_iii.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/generation_iv.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/gold.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/home.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/official_artwork.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/other.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/red_blue.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/species.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/sprites.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/detail/versions.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/features/pokemon/domain/usescases/get_pokemon_list_usecase.dart';

import '../../domain/usescases/get_pokemon_detail_usecase.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  GetPokemonListUseCase getPokemonListUseCase;
  GetPokemonDetailUseCase getPokemonDetailUseCase;
  PokemonBloc({
    required this.getPokemonListUseCase,
    required this.getPokemonDetailUseCase,
  }) : super(PokemonInitial()) {
    on<GetPokemonsInfoEvent>((event, emit) async {
      emit(await _getPokemonList(event: event, emit: emit));
    });
    on<GetPokemonDetailInfoEvent>((event, emit) async {
      emit(await _getPokemonDetail(event: event, emit: emit));
    });
  }

  //Method to get de pokemons list
  Future<PokemonState> _getPokemonList({
    required GetPokemonsInfoEvent event,
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

  //Method to get de pokemons detail information
  Future<PokemonState> _getPokemonDetail({
    required GetPokemonDetailInfoEvent event,
    required Emitter<PokemonState> emit,
  }) async {
    emit(LoadingGetPokemonDetailState());

    final pokemon = await getPokemonDetailUseCase(ParamsPokemonDetailUseCase(
      pokemonName: event.pokemonName,
    ));

    return pokemon.fold((failure) {
      emit(FailedGetPokemonDetailState(
          error:
              failure.props.isNotEmpty ? failure.props.first.toString() : ''));

      return GetPokemonDetailState(
          pokemonDetailEntity: PokemonDetailEntity(
        abilities: [],
        baseExperience: 0,
        forms: [],
        gameIndices: [],
        height: 0,
        heldItems: [],
        id: 0,
        isDefault: false,
        locationAreaEncounters: '',
        moves: [],
        name: '',
        order: 0,
        pastTypes: [],
        species: Species(name: '', url: ''),
        stats: [],
        types: [],
        weight: 0,
      ));
    }, (response) {
      emit(SuccessGetPokemonDetailState(pokemonDetailEntity: response));

      return GetPokemonDetailState(pokemonDetailEntity: response);
    });
  }
}
