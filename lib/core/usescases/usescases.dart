import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/network/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
