import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'origin.dart';

part 'character.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Character {
  Character();

  @JsonKey(name: "id")
  @HiveField(0)
  int id;
  @JsonKey(name: "name")
  @HiveField(1)
  String name;
  @JsonKey(name: "status")
  @HiveField(2)
  String status;
  @JsonKey(name: "species")
  @HiveField(3)
  String species;
  @JsonKey(name: "gender")
  @HiveField(4)
  String gender;
  @JsonKey(name: "origin")
  @HiveField(5)
  Origin origin;
  @JsonKey(name: "image")
  @HiveField(6)
  String imageUrl;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
