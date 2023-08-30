import 'package:flutter/material.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {required super.id,
      required super.name,
      required super.url,
      required super.color});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['url']
          .toString()
          .split('/')[json['url'].toString().split('/').length - 2],
      name: json['name'],
      url: json['url'],
      color: Colors.black45,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['id'] = id;
    data['color'] = color;
    return data;
  }
}
