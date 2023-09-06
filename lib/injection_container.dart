import 'package:get_it/get_it.dart';
import 'package:pokemon_app/core/network/network_info.dart';
import 'package:pokemon_app/core/network/server_api_client.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/pokemon_datasource_impl.dart';
import 'package:pokemon_app/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_app/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/features/pokemon/domain/usescases/get_pokemon_detail_usecase.dart';
import 'package:pokemon_app/features/pokemon/domain/usescases/get_pokemon_list_usecase.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/pokemon_bloc.dart';

import 'features/pokemon/data/datasources/pokemon_datasource.dart';

final getIt = GetIt.instance;

Future<void> injectDependencies() async {
  //! Features - Pokemon
  getIt.registerFactory(
    () => PokemonBloc(
      getPokemonListUseCase: getIt(),
      getPokemonDetailUseCase: getIt(),
    ),
  );

  //! Usescases
  getIt.registerLazySingleton(() => GetPokemonListUseCase(repository: getIt()));
  getIt.registerLazySingleton(
      () => GetPokemonDetailUseCase(repository: getIt()));

  //! Repositories
  getIt.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(
        pokemonDatasource: getIt(),
      ));

  //! Data Source
  getIt.registerLazySingleton<PokemonDatasource>(() => PokemonDatasourceImpl(
        apiClient: getIt(),
      ));

  //!Server Api clinet to http to consume rest services
  getIt.registerLazySingleton(() => ServerApiClient(
        networkInfoRepository: getIt(),
      ));

  //! Core
  getIt.registerLazySingleton<NetworkInfoRepository>(
      () => NetworkInfoRepositoryImpl());
}
