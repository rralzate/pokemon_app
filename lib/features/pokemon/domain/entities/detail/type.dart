import 'dart:convert';
import 'species.dart';

class TypePokemon {
  final int slot;
  final Species type;

  TypePokemon({
    required this.slot,
    required this.type,
  });

  TypePokemon copyWith({
    int? slot,
    Species? type,
  }) =>
      TypePokemon(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );

  factory TypePokemon.fromRawJson(String str) =>
      TypePokemon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TypePokemon.fromJson(Map<String, dynamic> json) => TypePokemon(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
