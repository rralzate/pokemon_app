import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/network/exception.dart';

import 'package:pokemon_app/core/network/failure.dart';
import 'package:pokemon_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';

import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';

import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/pokemon_datasource.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDatasource pokemonDatasource;

  PokemonRepositoryImpl({
    required this.pokemonDatasource,
  });

  final colors = [
    Colors.amber,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.black,
    Colors.lime,
    Colors.teal,
    Colors.lightGreen,
    Colors.purpleAccent,
    Colors.blue,
    Colors.amberAccent,
    Colors.yellowAccent,
    Colors.white54,
    Colors.cyanAccent,
    Colors.black45,
    Colors.deepOrangeAccent
  ];
  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemonList() async {
    try {
      final result = await pokemonDatasource.getPokemonList();

      List<PokemonEntity> listEntity = [];

      for (var item in result) {
        var randomColorIndex = Random().nextInt(colors.length);

        PokemonModel pokemon = item;
        pokemon.color = colors[randomColorIndex];
        listEntity.add(pokemon);
      }
      return right(listEntity);
    } on ServerException catch (e) {
      return Left(ErrorFailure(error: e.message));
    } on Object {
      return Left(ErrorFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonDetailEntity>> getPokemonDetail(
      {required String pokemonName}) async {
    try {
      final result = await pokemonDatasource.getPokemonDetail(
        name: pokemonName,
      );
      return right(result);
    } on ServerException catch (e) {
      return Left(ErrorFailure(error: e.message));
    } on Object {
      return Left(ErrorFailure());
    }
  }
}
