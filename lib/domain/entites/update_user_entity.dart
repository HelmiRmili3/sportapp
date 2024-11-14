class UpdateUserEntity {
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String jobTitle;
  final String experience;
  final String profilePicture;
  final int gymCredit;
  final bool isBanned;
  final int referralAvailedCount;
  final int credit;

  UpdateUserEntity({
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.experience,
    required this.profilePicture,
    required this.gymCredit,
    required this.isBanned,
    required this.referralAvailedCount,
    required this.credit,
  });

  // From JSON map to object
  factory UpdateUserEntity.fromJson(Map<String, dynamic> json) {
    return UpdateUserEntity(
      phoneNumber: json['phone_number'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      jobTitle: json['job_title'] as String,
      experience: json['experience'] as String,
      profilePicture: json['profilePicture'] as String,
      gymCredit: json['gymCredit'] as int,
      isBanned: json['isBanned'] as bool,
      referralAvailedCount: json['referral_availed_count'] as int,
      credit: json['credit'] as int,
    );
  }

  // Convert object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'job_title': jobTitle,
      'experience': experience,
      'profilePicture': profilePicture,
      'gymCredit': gymCredit,
      'isBanned': isBanned,
      'referral_availed_count': referralAvailedCount,
      'credit': credit,
    };
  }
}
