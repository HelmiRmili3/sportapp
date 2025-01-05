// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserResponse _$RegisterUserResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterUserResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$RegisterUserResponseToJson(
        RegisterUserResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
