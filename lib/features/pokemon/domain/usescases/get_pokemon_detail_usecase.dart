import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/network/failure.dart';
import 'package:pokemon_app/core/usescases/usescases.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonDetailUseCase
    implements UseCase<PokemonDetailEntity, ParamsPokemonDetailUseCase> {
  final PokemonRepository repository;

  GetPokemonDetailUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, PokemonDetailEntity>> call(
      ParamsPokemonDetailUseCase params) async {
    final result = await repository.getPokemonDetail(
      pokemonName: params.pokemonName,
    );

    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}

class ParamsPokemonDetailUseCase {
  final String pokemonName;

  ParamsPokemonDetailUseCase({
    required this.pokemonName,
  });
}
