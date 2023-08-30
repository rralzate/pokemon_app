import 'package:dartz/dartz.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';

import '../../../../core/network/failure.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getPokemonList();
}
