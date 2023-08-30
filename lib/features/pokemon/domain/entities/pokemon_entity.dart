import 'package:flutter/material.dart';

class PokemonEntity {
  String name;
  String url;
  String id;
  Color color;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.url,
    required this.color,
  });
}
