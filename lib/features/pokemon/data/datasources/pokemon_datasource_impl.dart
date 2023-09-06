import 'dart:convert';

import 'package:pokemon_app/core/network/server_api_client.dart';
import 'package:pokemon_app/features/pokemon/data/datasources/pokemon_datasource.dart';
import 'package:pokemon_app/features/pokemon/data/models/pokemon_detail_model.dart';
import 'package:pokemon_app/features/pokemon/data/models/pokemon_model.dart';

import '../../../../core/network/server_info.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  final ServerApiClient apiClient;

  PokemonDatasourceImpl({
    required this.apiClient,
  });

  static const String baseUrl = pokeApiBase;

  @override
  Future<List<dynamic>> getPokemonList() async {
    final response = await apiClient.get(
      pokemonAuthority,
      '$baseUrl/pokemon',
      serverSchema,
    );

    final decoded = jsonDecode(response.body);

    final results = decoded['results'];

    return results.map((item) => PokemonModel.fromJson(item)).toList();
  }

  @override
  Future<PokemonDetailModel> getPokemonDetail({required String name}) async {
    final response = await apiClient.get(
      pokemonAuthority,
      '$baseUrl/pokemon/$name',
      serverSchema,
    );
    final json = jsonDecode(response.body);
    return PokemonDetailModel.fromJson(json);
  }
}
