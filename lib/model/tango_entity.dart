import 'dart:convert';
import 'package:bintango_jp/generated/json/base/json_field.dart';
import 'package:bintango_jp/generated/json/tango_entity.g.dart';

@JsonSerializable()
class TangoEntity {

	int? id;
	String? myanmar;
	String? japaneseRomaji;
	String? japaneseKana;
	String? japaneseKanji;
	int? level;
  
  TangoEntity();

  factory TangoEntity.fromJson(Map<String, dynamic> json) => $TangoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TangoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}