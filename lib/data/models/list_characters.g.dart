// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_characters.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListCharactersAdapter extends TypeAdapter<ListCharacters> {
  @override
  final int typeId = 2;

  @override
  ListCharacters read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListCharacters(
      (fields[0] as List)?.cast<Character>(),
    );
  }

  @override
  void write(BinaryWriter writer, ListCharacters obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.characters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListCharactersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCharacters _$ListCharactersFromJson(Map<String, dynamic> json) {
  return ListCharacters(
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Character.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListCharactersToJson(ListCharacters instance) =>
    <String, dynamic>{
      'results': instance.characters,
    };
