class LoginResponse {
  final int statusCode;
  final String message;
  final LoginData data;

  LoginResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      data: LoginData.fromJson(json['data']),
    );
  }
}

class LoginData {
  final User user;
  final String accessToken;
  final String refreshToken;
  final String referralCode;

  LoginData({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.referralCode,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: User.fromJson(json['user']),
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      referralCode: json['referralCode'],
    );
  }
}

class User {
  final int id;
  final String password;
  final String email;
  final int role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? uuid;
  final String phoneNumber;
  final String phone;
  final String firstName;
  final String lastName;
  final String jobTitle;
  final String experience;
  final bool isBanned;
  final String? authProvider;
  final bool isSubscribed;
  final bool isDeleted;
  final String referralLink;
  final int referralAvailedCount;
  final bool isReferralLinkActive;
  final String profilePicture;
  final DateTime? banExpiresAt;
  final int gymCredit;
  final DateTime? banUntil;
  final DateTime? lastAccessDate;
  final int banCount;
  final int offenses;
  final String stripeCustomerId;
  final String referralCode;
  final String referredBy;
  final int credit;
  final int totalAmount;
  final int discountPercentage;
  final DateTime? discountExpiration;

  User({
    required this.id,
    required this.password,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.uuid,
    required this.phoneNumber,
    required this.phone,
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      password: json['password'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      uuid: json['uuid'],
      phoneNumber: json['phone_number'],
      phone: json['phone'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      jobTitle: json['job_title'],
      experience: json['experience'],
      isBanned: json['isBanned'],
      authProvider: json['auth_provider'],
      isSubscribed: json['is_subscribed'],
      isDeleted: json['is_deleted'],
      referralLink: json['referral_link'],
      referralAvailedCount: json['referral_availed_count'],
      isReferralLinkActive: json['is_referral_link_active'],
      profilePicture: json['profilePicture'],
      banExpiresAt: json['banExpiresAt'] != null
          ? DateTime.parse(json['banExpiresAt'])
          : null,
      gymCredit: json['gymCredit'],
      banUntil:
          json['banUntil'] != null ? DateTime.parse(json['banUntil']) : null,
      lastAccessDate: json['lastAcessDate'] != null
          ? DateTime.parse(json['lastAcessDate'])
          : null,
      banCount: json['banCount'],
      offenses: json['offenses'],
      stripeCustomerId: json['stripe_customer_id'],
      referralCode: json['referral_code'],
      referredBy: json['referred_by'],
      credit: json['credit'],
      totalAmount: json['total_amount'],
      discountPercentage: json['discountPercentage'],
      discountExpiration: json['discountExpiration'] != null
          ? DateTime.parse(json['discountExpiration'])
          : null,
    );
  }
}
