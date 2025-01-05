import 'package:json_annotation/json_annotation.dart';

part 'update_user_response_model.g.dart'; // Generated file

@JsonSerializable()
class UpdateUserResponse {
  final int statusCode;
  final String message;
  final dynamic data; // Use dynamic since data can be null

  UpdateUserResponse({
    required this.statusCode,
    required this.message,
    this.data, // Optional since it can be null
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserResponseToJson(this);
}
