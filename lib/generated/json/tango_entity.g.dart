import 'package:bintango_jp/generated/json/base/json_convert_content.dart';
import 'package:bintango_jp/model/tango_entity.dart';

TangoEntity $TangoEntityFromJson(Map<String, dynamic> json) {
	final TangoEntity tangoEntity = TangoEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		tangoEntity.id = id;
	}
	final String? myanmar = jsonConvert.convert<String>(json['myanmar']);
	if (myanmar != null) {
		tangoEntity.myanmar = myanmar;
	}
	final String? japaneseRomaji = jsonConvert.convert<String>(json['japaneseRomaji']);
	if (japaneseRomaji != null) {
		tangoEntity.japaneseRomaji = japaneseRomaji;
	}
	final String? japaneseKana = jsonConvert.convert<String>(json['japaneseKana']);
	if (japaneseKana != null) {
		tangoEntity.japaneseKana = japaneseKana;
	}
	final String? japaneseKanji = jsonConvert.convert<String>(json['japaneseKanji']);
	if (japaneseKana != null) {
		tangoEntity.japaneseKanji = japaneseKanji;
	}
	final int? level = jsonConvert.convert<int>(json['level']);
	if (level != null) {
		tangoEntity.level = level;
	}
	return tangoEntity;
}

Map<String, dynamic> $TangoEntityToJson(TangoEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['indonesian'] = entity.myanmar;
	data['japaneseRomaji'] = entity.japaneseRomaji;
	data['japaneseKana'] = entity.japaneseKana;
	data['japaneseKanji'] = entity.japaneseKanji;
	data['level'] = entity.level;
	return data;
}