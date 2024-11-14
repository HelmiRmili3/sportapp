class CoachEntity {
  final int id;
  final String password;
  final String email;
  final int role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String bio;
  final String certifications;
  final String experience;
  final String? specializations;
  final String personalTrainingPrice;
  final String groupSessionPrice;
  final String onlineTrainingPrice;
  final int maxClientsPerSession;
  final String commissionRate;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String profilePicture;
  final bool isVerified;
  final int totalSessionsConducted;
  final int activeClients;
  final int rating;

  CoachEntity({
    required this.id,
    required this.password,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.bio,
    required this.certifications,
    required this.experience,
    this.specializations,
    required this.personalTrainingPrice,
    required this.groupSessionPrice,
    required this.onlineTrainingPrice,
    required this.maxClientsPerSession,
    required this.commissionRate,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
    required this.isVerified,
    required this.totalSessionsConducted,
    required this.activeClients,
    required this.rating,
  });

  // Factory method to create a CoachEntity instance from JSON data
  factory CoachEntity.fromJson(Map<String, dynamic> json) {
    return CoachEntity(
      id: json['id'],
      password: json['password'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      bio: json['bio'],
      certifications: json['certifications'],
      experience: json['experience'],
      specializations: json['specializations'],
      personalTrainingPrice: json['personal_training_price'],
      groupSessionPrice: json['group_session_price'],
      onlineTrainingPrice: json['online_training_price'],
      maxClientsPerSession: json['max_clients_per_session'],
      commissionRate: json['commission_rate'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      profilePicture: json['profilePicture'],
      isVerified: json['is_verified'],
      totalSessionsConducted: json['total_sessions_conducted'],
      activeClients: json['active_clients'],
      rating: json['rating'],
    );
  }

  // Method to convert a CoachEntity instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'email': email,
      'role': role,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'bio': bio,
      'certifications': certifications,
      'experience': experience,
      'specializations': specializations,
      'personal_training_price': personalTrainingPrice,
      'group_session_price': groupSessionPrice,
      'online_training_price': onlineTrainingPrice,
      'max_clients_per_session': maxClientsPerSession,
      'commission_rate': commissionRate,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'profilePicture': profilePicture,
      'is_verified': isVerified,
      'total_sessions_conducted': totalSessionsConducted,
      'active_clients': activeClients,
      'rating': rating,
    };
  }
}
