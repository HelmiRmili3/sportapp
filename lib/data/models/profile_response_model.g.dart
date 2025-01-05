// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: UserProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseToJson(
        UserProfileResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

UserProfileData _$UserProfileDataFromJson(Map<String, dynamic> json) =>
    UserProfileData(
      id: json['id'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      role: (json['role'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      uuid: json['uuid'] as String?,
      phoneNumber: json['phone_number'] as String?,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      jobTitle: json['job_title'] as String,
      experience: json['experience'] as String,
      isBanned: json['isBanned'] as bool,
      authProvider: json['auth_provider'] as String?,
      isSubscribed: json['is_subscribed'] as bool,
      isDeleted: json['is_deleted'] as bool,
      referralLink: json['referral_link'] as String,
      referralAvailedCount: (json['referral_availed_count'] as num).toInt(),
      isReferralLinkActive: json['is_referral_link_active'] as bool,
      profilePicture: json['profilePicture'] as String,
      banExpiresAt: json['banExpiresAt'] == null
          ? null
          : DateTime.parse(json['banExpiresAt'] as String),
      gymCredit: (json['gymCredit'] as num).toInt(),
      banUntil: json['banUntil'] == null
          ? null
          : DateTime.parse(json['banUntil'] as String),
      lastAccessDate: json['lastAcessDate'] == null
          ? null
          : DateTime.parse(json['lastAcessDate'] as String),
      banCount: (json['banCount'] as num).toInt(),
      offenses: (json['offenses'] as num).toInt(),
      stripeCustomerId: json['stripe_customer_id'] as String,
      referralCode: json['referral_code'] as String,
      referredBy: json['referred_by'] as String,
      credit: (json['credit'] as num).toInt(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      discountExpiration: json['discountExpiration'] == null
          ? null
          : DateTime.parse(json['discountExpiration'] as String),
    );

Map<String, dynamic> _$UserProfileDataToJson(UserProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'email': instance.email,
      'role': instance.role,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'uuid': instance.uuid,
      'phone_number': instance.phoneNumber,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'job_title': instance.jobTitle,
      'experience': instance.experience,
      'isBanned': instance.isBanned,
      'auth_provider': instance.authProvider,
      'is_subscribed': instance.isSubscribed,
      'is_deleted': instance.isDeleted,
      'referral_link': instance.referralLink,
      'referral_availed_count': instance.referralAvailedCount,
      'is_referral_link_active': instance.isReferralLinkActive,
      'profilePicture': instance.profilePicture,
      'banExpiresAt': instance.banExpiresAt?.toIso8601String(),
      'gymCredit': instance.gymCredit,
      'banUntil': instance.banUntil?.toIso8601String(),
      'lastAcessDate': instance.lastAccessDate?.toIso8601String(),
      'banCount': instance.banCount,
      'offenses': instance.offenses,
      'stripe_customer_id': instance.stripeCustomerId,
      'referral_code': instance.referralCode,
      'referred_by': instance.referredBy,
      'credit': instance.credit,
      'total_amount': instance.totalAmount,
      'discountPercentage': instance.discountPercentage,
      'discountExpiration': instance.discountExpiration?.toIso8601String(),
    };
