// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterAdapter extends TypeAdapter<Character> {
  @override
  final int typeId = 1;

  @override
  Character read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Character()
      ..id = fields[0] as int
      ..name = fields[1] as String
      ..status = fields[2] as String
      ..species = fields[3] as String
      ..gender = fields[4] as String
      ..origin = fields[5] as Origin
      ..imageUrl = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, Character obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.origin)
      ..writeByte(6)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return Character()
    ..id = json['id'] as int
    ..name = json['name'] as String
    ..status = json['status'] as String
    ..species = json['species'] as String
    ..gender = json['gender'] as String
    ..origin = json['origin'] == null
        ? null
        : Origin.fromJson(json['origin'] as Map<String, dynamic>)
    ..imageUrl = json['image'] as String;
}

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'gender': instance.gender,
      'origin': instance.origin,
      'image': instance.imageUrl,
    };
