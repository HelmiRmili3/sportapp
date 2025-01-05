import 'package:json_annotation/json_annotation.dart';

part 'register_user_response_model.g.dart'; // Generated file

@JsonSerializable()
class RegisterUserResponse {
  final int statusCode;
  final String message;
  final dynamic data; // Use dynamic since data can be null

  RegisterUserResponse({
    required this.statusCode,
    required this.message,
    this.data, // Optional since it can be null
  });

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserResponseToJson(this);
}
