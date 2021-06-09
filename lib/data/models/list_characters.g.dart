// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCharacters _$ListCharactersFromJson(Map<String, dynamic> json) {
  return ListCharacters()
    ..characters = (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Character.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ListCharactersToJson(ListCharacters instance) =>
    <String, dynamic>{
      'results': instance.characters,
    };
