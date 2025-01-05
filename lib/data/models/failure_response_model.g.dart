// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FailureResponse _$FailureResponseFromJson(Map<String, dynamic> json) =>
    FailureResponse(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      message: json['message'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$FailureResponseToJson(FailureResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
    };
