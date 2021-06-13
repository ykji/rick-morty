import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'origin.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Origin {
  Origin();

  @JsonKey(name: "name")
  @HiveField(0)
  String name;

  @JsonKey(name: "url")
  @HiveField(1)
  String url;

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
  Map<String, dynamic> toJson() => _$OriginToJson(this);
}
