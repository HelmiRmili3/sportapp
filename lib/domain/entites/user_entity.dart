class UserEntity {
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
  final double totalAmount;
  final double discountPercentage;
  final DateTime? discountExpiration;

  UserEntity({
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

  // Factory method to create a UserEntity instance from JSON data
  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
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
      totalAmount: json['total_amount'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      discountExpiration: json['discountExpiration'] != null
          ? DateTime.parse(json['discountExpiration'])
          : null,
    );
  }

  // Method to convert a UserEntity instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'email': email,
      'role': role,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'uuid': uuid,
      'phone_number': phoneNumber,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
      'job_title': jobTitle,
      'experience': experience,
      'isBanned': isBanned,
      'auth_provider': authProvider,
      'is_subscribed': isSubscribed,
      'is_deleted': isDeleted,
      'referral_link': referralLink,
      'referral_availed_count': referralAvailedCount,
      'is_referral_link_active': isReferralLinkActive,
      'profilePicture': profilePicture,
      'banExpiresAt': banExpiresAt?.toIso8601String(),
      'gymCredit': gymCredit,
      'banUntil': banUntil?.toIso8601String(),
      'lastAcessDate': lastAccessDate?.toIso8601String(),
      'banCount': banCount,
      'offenses': offenses,
      'stripe_customer_id': stripeCustomerId,
      'referral_code': referralCode,
      'referred_by': referredBy,
      'credit': credit,
      'total_amount': totalAmount,
      'discountPercentage': discountPercentage,
      'discountExpiration': discountExpiration?.toIso8601String(),
    };
  }
}
