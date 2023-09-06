import 'package:pokemon_app/features/pokemon/data/models/pokemon_detail_model.dart';

abstract class PokemonDatasource {
  Future<List<dynamic>> getPokemonList();

  Future<PokemonDetailModel> getPokemonDetail({required String name});
}
