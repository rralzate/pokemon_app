import 'package:pokemon_app/features/pokemon/domain/entities/detail/type.dart';

import 'detail/ability.dart';
import 'detail/game_index.dart';
import 'detail/held_item.dart';
import 'detail/move.dart';
import 'detail/species.dart';
import 'detail/sprites.dart';
import 'detail/stat.dart';

class PokemonDetailEntity {
  final List<Ability> abilities;
  final int baseExperience;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<HeldItem> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites? sprites;
  final List<Stat> stats;
  final List<TypePokemon> types;
  final int weight;

  PokemonDetailEntity({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });
}
