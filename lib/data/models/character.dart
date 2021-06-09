import 'package:json_annotation/json_annotation.dart';

import 'origin.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  Character();

  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "species")
  String species;
  @JsonKey(name: "gender")
  String gender;
  @JsonKey(name: "origin")
  Origin origin;
  @JsonKey(name: "image")
  String imageUrl;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
