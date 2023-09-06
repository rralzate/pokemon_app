import 'dart:convert';

import 'dream_world.dart';
import 'home.dart';
import 'official_artwork.dart';

class Other {
  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  Other copyWith({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
  }) =>
      Other(
        dreamWorld: dreamWorld ?? this.dreamWorld,
        home: home ?? this.home,
        officialArtwork: officialArtwork ?? this.officialArtwork,
      );

  factory Other.fromRawJson(String str) => Other.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "home": home.toJson(),
        "official-artwork": officialArtwork.toJson(),
      };
}
