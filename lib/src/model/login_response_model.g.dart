// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) {
  return LoginResponseModel(
    json['message'] as String,
    json['success'] as String,
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'data': instance.data?.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['id'] as String,
    json['email'] as String,
    json['nama'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nama': instance.nama,
    };
