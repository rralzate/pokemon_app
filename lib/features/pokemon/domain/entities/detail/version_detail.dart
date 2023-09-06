import 'dart:convert';

import 'species.dart';

class VersionDetail {
  final int rarity;
  final Species version;

  VersionDetail({
    required this.rarity,
    required this.version,
  });

  VersionDetail copyWith({
    int? rarity,
    Species? version,
  }) =>
      VersionDetail(
        rarity: rarity ?? this.rarity,
        version: version ?? this.version,
      );

  factory VersionDetail.fromRawJson(String str) =>
      VersionDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"],
        version: Species.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "rarity": rarity,
        "version": version.toJson(),
      };
}
