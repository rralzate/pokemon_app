import 'dart:convert';

import 'dream_world.dart';

class GenerationViii {
  final DreamWorld icons;

  GenerationViii({
    required this.icons,
  });

  GenerationViii copyWith({
    DreamWorld? icons,
  }) =>
      GenerationViii(
        icons: icons ?? this.icons,
      );

  factory GenerationViii.fromRawJson(String str) =>
      GenerationViii.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
      };
}
