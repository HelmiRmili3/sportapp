class UserRegisterRequestModel {
  final String email;
  final String password;
  final String profilePicture;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  UserRegisterRequestModel({
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      // 'profilePicture': profilePicture,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    };
  }

  // Create a model from a JSON map
  factory UserRegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return UserRegisterRequestModel(
      email: json['email'],
      password: json['password'],
      profilePicture: json['profilePicture'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
    );
  }
}
