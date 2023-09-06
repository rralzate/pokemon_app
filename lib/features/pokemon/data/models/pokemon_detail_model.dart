import 'dart:convert';

import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail_entity.dart';

import '../../domain/entities/detail/ability.dart';
import '../../domain/entities/detail/game_index.dart';
import '../../domain/entities/detail/held_item.dart';
import '../../domain/entities/detail/move.dart';
import '../../domain/entities/detail/species.dart';
import '../../domain/entities/detail/stat.dart';
import '../../domain/entities/detail/type.dart';

class PokemonDetailModel extends PokemonDetailEntity {
  PokemonDetailModel({
    required super.abilities,
    required super.baseExperience,
    required super.forms,
    required super.gameIndices,
    required super.height,
    required super.heldItems,
    required super.id,
    required super.isDefault,
    required super.locationAreaEncounters,
    required super.moves,
    required super.name,
    required super.order,
    required super.pastTypes,
    required super.species,
    required super.sprites,
    required super.stats,
    required super.types,
    required super.weight,
  });

  factory PokemonDetailModel.fromRawJson(String str) =>
      PokemonDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailModel(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms:
            List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        gameIndices: List<GameIndex>.from(
            json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: List<HeldItem>.from(
            json["held_items"].map((x) => HeldItem.fromJson(x))),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromJson(json["species"]),
        sprites: null,
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<TypePokemon>.from(
            json["types"].map((x) => TypePokemon.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x.toJson())),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toJson(),
        "sprites": sprites?.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
}
