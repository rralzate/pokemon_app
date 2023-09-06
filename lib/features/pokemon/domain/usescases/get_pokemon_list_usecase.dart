import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/network/failure.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';

import '../../../../core/usescases/usescases.dart';

class GetPokemonListUseCase implements UseCase<List<PokemonEntity>, NoParams> {
  final PokemonRepository repository;

  GetPokemonListUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<PokemonEntity>>> call(NoParams params) async {
    final result = await repository.getPokemonList();
    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(resp),
    );
  }
}
