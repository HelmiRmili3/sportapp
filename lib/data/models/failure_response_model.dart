import 'package:json_annotation/json_annotation.dart';

part 'failure_response_model.g.dart'; // Generated file

@JsonSerializable()
class FailureResponse {
  final int? statusCode; // Nullable
  final String? message; // Nullable
  final String? error; // Nullable

  FailureResponse({
    this.statusCode, // Nullable
    this.message, // Nullable
    this.error, // Nullable
  });

  factory FailureResponse.fromJson(Map<String, dynamic> json) =>
      _$FailureResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FailureResponseToJson(this);
}
