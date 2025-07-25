import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponse {
  final int statusCode;
  final String message;
  final LoginData data;

  LoginResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final User user;
  final String access_token;
  final String refresh_token;
  final String referralCode;

  LoginData({
    required this.user,
    required this.access_token,
    required this.refresh_token,
    required this.referralCode,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class User {
  final String id;
  final String password;
  final String email;
  final int role;
  final String created_at;
  final String updated_at;
  final String? uuid;
  final String? phone_number;
  final String first_name;
  final String last_name;
  final String job_title;
  final String experience;
  final bool isBanned;
  final List<dynamic>? auth_provider;
  final bool is_subscribed;
  final bool is_deleted;
  final String referral_link;
  final int referral_availed_count;
  final bool is_referral_link_active;
  final String profilePicture;
  final String? banExpiresAt;
  final int gymCredit;
  final String? banUntil;
  final String? lastAcessDate;
  final int banCount;
  final int offenses;
  final String stripe_customer_id;
  final String referral_code;
  final String referred_by;
  final int credit;
  final int total_amount;
  final int discountPercentage;
  final String? discountExpiration;

  User({
    required this.id,
    required this.password,
    required this.email,
    required this.role,
    required this.created_at,
    required this.updated_at,
    this.uuid,
    this.phone_number,
    required this.first_name,
    required this.last_name,
    required this.job_title,
    required this.experience,
    required this.isBanned,
    this.auth_provider,
    required this.is_subscribed,
    required this.is_deleted,
    required this.referral_link,
    required this.referral_availed_count,
    required this.is_referral_link_active,
    required this.profilePicture,
    this.banExpiresAt,
    required this.gymCredit,
    this.banUntil,
    this.lastAcessDate,
    required this.banCount,
    required this.offenses,
    required this.stripe_customer_id,
    required this.referral_code,
    required this.referred_by,
    required this.credit,
    required this.total_amount,
    required this.discountPercentage,
    this.discountExpiration,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
