// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'origin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OriginAdapter extends TypeAdapter<Origin> {
  @override
  final int typeId = 0;

  @override
  Origin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Origin()
      ..name = fields[0] as String
      ..url = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, Origin obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OriginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Origin _$OriginFromJson(Map<String, dynamic> json) {
  return Origin()
    ..name = json['name'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$OriginToJson(Origin instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
