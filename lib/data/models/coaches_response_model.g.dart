// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaches_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachesResponse _$CoachesResponseFromJson(Map<String, dynamic> json) =>
    CoachesResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Coach.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoachesResponseToJson(CoachesResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };

Coach _$CoachFromJson(Map<String, dynamic> json) => Coach(
      id: json['id'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      role: (json['role'] as num).toInt(),
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      uuid: json['uuid'] as String?,
      phone_number: json['phone_number'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      job_title: json['job_title'] as String,
      experience: json['experience'] as String,
      isBanned: json['isBanned'] as bool,
      auth_provider: json['auth_provider'] as String?,
      is_subscribed: json['is_subscribed'] as bool,
      is_deleted: json['is_deleted'] as bool,
      referral_link: json['referral_link'] as String,
      referral_availed_count: (json['referral_availed_count'] as num).toInt(),
      is_referral_link_active: json['is_referral_link_active'] as bool,
      profilePicture: json['profilePicture'] as String,
      banExpiresAt: json['banExpiresAt'] as String?,
      gymCredit: (json['gymCredit'] as num).toInt(),
      banUntil: json['banUntil'] as String?,
      lastAcessDate: json['lastAcessDate'] as String?,
      banCount: (json['banCount'] as num).toInt(),
      offenses: (json['offenses'] as num).toInt(),
      stripe_customer_id: json['stripe_customer_id'] as String,
      referral_code: json['referral_code'] as String,
      referred_by: json['referred_by'] as String,
      credit: (json['credit'] as num).toInt(),
      total_amount: (json['total_amount'] as num).toInt(),
      discountPercentage: (json['discountPercentage'] as num).toInt(),
      discountExpiration: json['discountExpiration'] as String?,
    );

Map<String, dynamic> _$CoachToJson(Coach instance) => <String, dynamic>{
      'id': instance.id,
      'password': instance.password,
      'email': instance.email,
      'role': instance.role,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'uuid': instance.uuid,
      'phone_number': instance.phone_number,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'job_title': instance.job_title,
      'experience': instance.experience,
      'isBanned': instance.isBanned,
      'auth_provider': instance.auth_provider,
      'is_subscribed': instance.is_subscribed,
      'is_deleted': instance.is_deleted,
      'referral_link': instance.referral_link,
      'referral_availed_count': instance.referral_availed_count,
      'is_referral_link_active': instance.is_referral_link_active,
      'profilePicture': instance.profilePicture,
      'banExpiresAt': instance.banExpiresAt,
      'gymCredit': instance.gymCredit,
      'banUntil': instance.banUntil,
      'lastAcessDate': instance.lastAcessDate,
      'banCount': instance.banCount,
      'offenses': instance.offenses,
      'stripe_customer_id': instance.stripe_customer_id,
      'referral_code': instance.referral_code,
      'referred_by': instance.referred_by,
      'credit': instance.credit,
      'total_amount': instance.total_amount,
      'discountPercentage': instance.discountPercentage,
      'discountExpiration': instance.discountExpiration,
    };
