import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart'; // Generated file

@JsonSerializable()
class UserProfileResponse {
  final int statusCode;
  final String message;
  final UserProfileData data;

  UserProfileResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  // From JSON
  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
}

@JsonSerializable()
class UserProfileData {
  final String id;
  final String password;
  final String email;
  final int role;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final String? uuid;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'job_title')
  final String jobTitle;
  final String experience;
  @JsonKey(name: 'isBanned')
  final bool isBanned;
  @JsonKey(name: 'auth_provider')
  final String? authProvider;
  @JsonKey(name: 'is_subscribed')
  final bool isSubscribed;
  @JsonKey(name: 'is_deleted')
  final bool isDeleted;
  @JsonKey(name: 'referral_link')
  final String referralLink;
  @JsonKey(name: 'referral_availed_count')
  final int referralAvailedCount;
  @JsonKey(name: 'is_referral_link_active')
  final bool isReferralLinkActive;
  final String profilePicture;
  @JsonKey(name: 'banExpiresAt')
  final DateTime? banExpiresAt;
  @JsonKey(name: 'gymCredit')
  final int gymCredit;
  @JsonKey(name: 'banUntil')
  final DateTime? banUntil;
  @JsonKey(name: 'lastAcessDate')
  final DateTime? lastAccessDate;
  @JsonKey(name: 'banCount')
  final int banCount;
  final int offenses;
  @JsonKey(name: 'stripe_customer_id')
  final String stripeCustomerId;
  @JsonKey(name: 'referral_code')
  final String referralCode;
  @JsonKey(name: 'referred_by')
  final String referredBy;
  final int credit;
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @JsonKey(name: 'discountPercentage')
  final double discountPercentage;
  @JsonKey(name: 'discountExpiration')
  final DateTime? discountExpiration;

  UserProfileData({
    required this.id,
    required this.password,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.uuid,
    this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.experience,
    required this.isBanned,
    this.authProvider,
    required this.isSubscribed,
    required this.isDeleted,
    required this.referralLink,
    required this.referralAvailedCount,
    required this.isReferralLinkActive,
    required this.profilePicture,
    this.banExpiresAt,
    required this.gymCredit,
    this.banUntil,
    this.lastAccessDate,
    required this.banCount,
    required this.offenses,
    required this.stripeCustomerId,
    required this.referralCode,
    required this.referredBy,
    required this.credit,
    required this.totalAmount,
    required this.discountPercentage,
    this.discountExpiration,
  });

  // From JSON
  factory UserProfileData.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$UserProfileDataToJson(this);
}
