import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_morty/data/models/character.dart';

part 'list_characters.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class ListCharacters {
  ListCharacters(this.characters);

  @JsonKey(name: "results")
  @HiveField(0)
  List<Character> characters;

  factory ListCharacters.fromJson(Map<String, dynamic> json) =>
      _$ListCharactersFromJson(json);
  Map<String, dynamic> toJson() => _$ListCharactersToJson(this);
}
