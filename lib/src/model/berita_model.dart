
import 'package:json_annotation/json_annotation.dart';

part 'berita_model.g.dart';

@JsonSerializable(explicitToJson: true)

class BeritaModel
{
  @JsonKey(name : "message")
  String message;

  @JsonKey(name : "success")
  String success;

  @JsonKey(name : "data")
  List<Data> data;


  BeritaModel(
      this.message,
      this.success,
      this.data,
  );

  factory BeritaModel.fromJson(Map<String, dynamic> json) => _$BeritaModelFromJson(json);

  Map<String, dynamic> toJson() => _$BeritaModelToJson(this);

  @override
  String toString() => 'Post { id: $message }';


}

@JsonSerializable()
class Data
{
  @JsonKey(name : "id")
  String id;

  @JsonKey(name : "isi_berita")
  String isi_berita;

  @JsonKey(name : "pengirim")
  String pengirim;

  @JsonKey(name : "avatar")
  String avatar;

  @JsonKey(name : "status")
  String status;

  @JsonKey(name : "foto")
  List<Foto> foto;

  Data(
      this.id,
      this.isi_berita,
      this.pengirim,
      this.avatar,
      this.status,
      this.foto
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() => 'Post { id: $id }';


}

@JsonSerializable()
class Foto
{
  @JsonKey(name : "url")
  String url;

  Foto(
      this.url,
  );

  factory Foto.fromJson(Map<String, dynamic> json) => _$FotoFromJson(json);

  Map<String, dynamic> toJson() => _$FotoToJson(this);

  @override
  String toString() => 'Post { id: $url }';


}
