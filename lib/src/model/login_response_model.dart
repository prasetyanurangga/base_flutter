
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(explicitToJson: true)

class LoginResponseModel
{
  @JsonKey(name : "message")
  String message;

  @JsonKey(name : "success")
  String success;

  @JsonKey(name : "data")
  Data data;


  LoginResponseModel(
      this.message,
      this.success,
      this.data,
  );

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  String toString() => 'Post { id: $message }';


}

@JsonSerializable()
class Data
{
  @JsonKey(name : "id")
  String id;

  @JsonKey(name : "email")
  String email;

  @JsonKey(name : "nama")
  String nama;

  Data(
      this.id,
      this.email,
      this.nama,
      );

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  String toString() => 'Post { id: $id }';


}
