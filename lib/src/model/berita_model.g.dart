// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeritaModel _$BeritaModelFromJson(Map<String, dynamic> json) {
  return BeritaModel(
    json['message'] as String,
    json['success'] as String,
    (json['data'] as List)
        ?.map(
            (e) => e == null ? null : Data.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BeritaModelToJson(BeritaModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'data': instance.data?.map((e) => e?.toJson())?.toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as String,
    json['isi_berita'] as String,
    json['pengirim'] as String,
    json['avatar'] as String,
    json['status'] as String,
    (json['foto'] as List)
        ?.map(
            (e) => e == null ? null : Foto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'isi_berita': instance.isi_berita,
      'pengirim': instance.pengirim,
      'avatar': instance.avatar,
      'status': instance.status,
      'foto': instance.foto,
    };

Foto _$FotoFromJson(Map<String, dynamic> json) {
  return Foto(
    json['url'] as String,
  );
}

Map<String, dynamic> _$FotoToJson(Foto instance) => <String, dynamic>{
      'url': instance.url,
    };
