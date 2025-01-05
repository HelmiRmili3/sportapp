import 'package:json_annotation/json_annotation.dart';

part 'logout_response_model.g.dart'; // Generated file

@JsonSerializable()
class LogoutResponse {
  final int statusCode;
  final String message;
  final dynamic data; // Use dynamic since data can be null

  LogoutResponse({
    required this.statusCode,
    required this.message,
    this.data, // Optional since it can be null
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseToJson(this);
}
